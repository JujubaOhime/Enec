class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit,:change_password,:therm_agreement, :update, :destroy]
  before_action :current_user
  before_action :user_kick
  # before_action :admin_only, only: [:destroy, :index, :new, :create]
  include ApplicationHelper
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all.offset(1)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @lots = Lot.all
  end


  # GET /users/1/edit
  def edit
    @lots = Lot.all
    @ies = Ies.all
  end

  def change_password
  end

  def therm_agreement
  
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    @user.image = Rails.root.join("app/assets/images/perfil.jpg").open
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if params[:package_id]
      @user.package_id = params[:package_id]
    end
    if params[:therm_acepted]
      @user.therm_acepted = params[:therm_acepted]
    end

    user_changed_attributes = @user.changed
    package_id = "package_id"
    term_acceptance = "therm_acepted"
    if package_id.in?(user_changed_attributes) or term_acceptance.in?(user_changed_attributes)
      @user.save!
      redirect_to new_payment_path
    end
    respond_to do |format|
      if @user.update(user_params)
        if admin_user_logged?
          format.html { redirect_to users_path, notice: 'Usuário atualizado com sucesso.' }
        else
            format.html { redirect_to @user, notice: 'Usuário atualizado com sucesso.' }
            format.json { render :show, status: :ok, location: @user }
        end
      else
        @ies = Ies.all
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuário excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :delegation, :lot_id, :name, :cpf, :rg, :rg_issuing_body, :birth_date, :gender, :address, :city, :state, :admin, :registration_proof, :password, :password_confirmation, :therm_accepted, :telephone, :IES_id, :course, :period, :package_id)
    end
end
