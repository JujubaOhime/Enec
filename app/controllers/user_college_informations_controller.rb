class UserCollegeInformationsController < ApplicationController
  before_action :set_user_college_information, only: [:show, :edit, :update, :destroy]

  # GET /user_college_informations
  # GET /user_college_informations.json
  def index
    @user_college_informations = UserCollegeInformation.all
  end

  # GET /user_college_informations/1
  # GET /user_college_informations/1.json
  def show
  end

  # GET /user_college_informations/new
  def new
    @user_college_information = UserCollegeInformation.new
  end

  # GET /user_college_informations/1/edit
  def edit
  end

  # POST /user_college_informations
  # POST /user_college_informations.json
  def create
    @user_college_information = UserCollegeInformation.new(user_college_information_params)

    respond_to do |format|
      if @user_college_information.save
        format.html { redirect_to @user_college_information, notice: 'User college information was successfully created.' }
        format.json { render :show, status: :created, location: @user_college_information }
      else
        format.html { render :new }
        format.json { render json: @user_college_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_college_informations/1
  # PATCH/PUT /user_college_informations/1.json
  def update
    respond_to do |format|
      if @user_college_information.update(user_college_information_params)
        format.html { redirect_to @user_college_information, notice: 'User college information was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_college_information }
      else
        format.html { render :edit }
        format.json { render json: @user_college_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_college_informations/1
  # DELETE /user_college_informations/1.json
  def destroy
    @user_college_information.destroy
    respond_to do |format|
      format.html { redirect_to user_college_informations_url, notice: 'User college information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_college_information
      @user_college_information = UserCollegeInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_college_information_params
      params.require(:user_college_information).permit(:user_id, :IES_id, :course, :period, :registration_proof)
    end
end
