class UsersController < ApplicationController
  include ApplicationHelper

  before_action except: [:edit, :update, :show, :change_password, :term_agreement] do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  
  before_action :set_user, only: [:show, :edit, :change_password, :term_agreement, :update, :destroy]
  before_action :current_user
  before_action :user_kick
  # before_action :admin_only, only: [:destroy, :index, :new, :create]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all.offset(1)
    @users = if params[:term]
      User.where("name LIKE (?) OR email LIKE (?)", "%#{params[:term]}%", "%#{params[:term]}%").paginate(page: params[:page], per_page: 10)
    else
      User.paginate(page: params[:page], per_page: 10)
    end
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

  def term_agreement
  
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
    @user.assign_attributes(user_params)

    if @user.subscribe_status_changed?
      needs_to_be_admin("Apenas administradores podem fazer isso!")
    end

    changed_attributes = @user.changed
    if "package_id".in?(changed_attributes) or "term_accepted".in?(changed_attributes)
      user_chose_a_package = true
    end

    respond_to do |format|
      if @user.save
        if admin_user_logged?
          format.html { redirect_to users_path, notice: 'Usuário atualizado com sucesso.' }
        elsif user_chose_a_package
          format.html { redirect_to new_payment_path, notice: 'Usuário atualizado com sucesso.' }
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
      params.require(:user).permit(
        :lot_id, 
        :IES_id,
        :package_id,
        :payment_id,
        :email, 
        :delegation, 
        :name,
        :telephone,  
        :cpf, 
        :rg, 
        :rg_issuing_body, 
        :birth_date, 
        :gender, 
        :address, 
        :city, 
        :state,
        :password, 
        :password_confirmation,  
        :admin,
        :course,
        :period,  
        :registration_proof, 
        :subscribe_status,
        :term_accepted
        )
    end
end
