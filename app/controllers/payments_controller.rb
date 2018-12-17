class PaymentsController < ApplicationController
  include PaymentsHelper
  include ActionView::Helpers::NumberHelper

  before_action :set_payment, only: [:show, :edit, :update, :destroy]
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
    package = Package.find(info[:package_id])
    payment = Payment.new(
      value: package.value,
      payment_option: info[:pagamento],
      parceling_option: info[:parcelas],
      user: current_user,
      package: package
    )
    if payment.save
      payment.generate_parcels
      current_user.update(package_id: package.id)
      
      info[:id] = current_user.id
      info[:package] = package
      PaymentMailer.notify_admin_about_payment(info).deliver_later
      PaymentMailer.notify_user_about_payment(current_user).deliver_later

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
