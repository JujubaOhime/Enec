class PaymentsController < ApplicationController
  require 'sendgrid-ruby'
  
  include PaymentsHelper
  include ActionView::Helpers::NumberHelper

  before_action except: [:show, :new, :create, :get_parcelas] do
    needs_to_be_admin("Você não tem permissão para isso!")
  end

  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action only: [:show] do
    if current_user.id != @payment.user_id
      needs_to_be_admin("Você não tem permissão para isso!")
    end
  end
  # before_action :admin_only, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    info = params.require(:subscription).permit(:name, :cpf, :package_id, :email, :telephone, :pagamento, :parcelas)
    info.values.each do |i|
      if i.nil?
        redirect_to new_payment_path, notice: "Preencha todos os campos!"
      end
    end

    package = Package.find(info[:package_id])
    payment = Payment.new(
      value: package.value,
      payment_option: info[:pagamento],
      parceling_option: info[:parcelas],
      user: current_user,
      package: package
    )
    if payment.save
      sendgrid = SendGrid::Client.new do |c|
        c.api_key = ENV["sendgrid_api_key"]
      end
      
      current_user.update(
        name: info[:name],
        cpf: info[:cpf],
        email: info[:email],
        telephone: info[:telephone]
      )
      payment.generate_parcels
      current_user.update(package_id: package.id)
      
      info[:id] = current_user.id
      info[:package] = package
      PaymentMailer.notify_admin_about_payment(info).deliver_later
      PaymentMailer.notify_user_about_payment(current_user).deliver_later
      
      @user_info = user_info
      @user = User.find(user_info[:id])
      
      email = SendGrid::Mail.new do |m|
        m.to      = 'enec2019@enec2019.fenec.com.br'
        m.from    = 'inscricaoenec@fenec.com.br'
        m.subject = "#{@user.name} criou um pagamento!"
        m.html    = 
        "<h1>Novo Pagamento Registrado!</h1>

        <p>
            Olá! O usuário #{@user.name} preencheu o formulário de pagamento.
        </p>
        
        <h2>Dados do Cliente</h2>
        
        <ul>
            <li>CPF: #{info[:cpf]}</li>
            <li>Nome: #{info[:name]}</li>
            <li>Email: #{info[:email]}</li>
            <li>Telefone: #{info[:telephone]}</li>
            <li>Pacote: #{info[:package].name}</li>
            <li>Forma de Pagamento: #{info[:pagamento]}</li>
            <li>Número de Parcelas: #{info[:parcelas]}</li>
        </ul>
        
        <p>
            #{view_context.link_to "Clique aqui", @user} para acessar o perfil deste usuário.
        </p>"
        
        m.text    = 
         "Novo Pagamento Registrado!

          
              Olá! O usuário #{@user.name} preencheu o formulário de pagamento.
          
          
          Dados do Cliente
          
          
              CPF: #{info[:cpf]}
              Nome: #{info[:name]}
              Email: #{info[:email]}
              Telefone: #{info[:telephone]}
              Pacote: #{info[:package].name}
              Forma de Pagamento: #{info[:pagamento]}
              Número de Parcelas: #{info[:parcelas]}
          
          
          
              #{view_context.link_to "Clique aqui", @user} para acessar o perfil deste usuário.
          "
      end
      
      email_user = SendGrid::Mail.new do |m|
        m.to      = @user.email
        m.from    = 'inscricaoenec@fenec.com.br'
        m.subject = "Solicitação de Pagamento registrada"
        m.html    = 
        "
        <p>
            Olá #{@user.name}. sua solicitação de pagamento foi registrada com sucesso!
        </p>
        "
        
        m.text    = 
         "
             Olá #{@user.name}. sua solicitação de pagamento foi registrada com sucesso!
         "
      end
      
      sendgrid.send(email)
      sendgrid.send(email_user)

      redirect_to payment
    else
      flash.notice = payment.errors
      redirect_to new_payment_path
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Pagamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Pagamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def get_parcelas
    @result = parcelas(params[:package_id], params[:pagamento])
    
    render json: @result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:package_id, :payment_option, :parceling_option, :user_id)
    end
end
