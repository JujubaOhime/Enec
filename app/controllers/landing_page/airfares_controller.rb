class LandingPage::AirfaresController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  
  before_action :set_airfare, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /airfares
  # GET /airfares.json
  def index
    @airfares =LandingPage::Airfare.all
  end

  # GET /airfares/1
  # GET /airfares/1.json
  def show
  end

  # GET /airfares/new
  def new
    @airfare =LandingPage::Airfare.new
  end

  # GET /airfares/1/edit
  def edit
  end

  # POST /airfares
  # POST /airfares.json
  def create
    @airfare =LandingPage::Airfare.new(airfare_params)

    respond_to do |format|
      if @airfare.save
        format.html { redirect_to sections_edit_path, notice: 'Passagem Aérea criada com sucesso.' }
        format.json { render :show, status: :created, location: @airfare }
      else
        format.html { render :new }
        format.json { render json: @airfare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /airfares/1
  # PATCH/PUT /airfares/1.json
  def update
    respond_to do |format|
      if @airfare.update(airfare_params)
        format.html { redirect_to sections_edit_path, notice: 'Passagem Aérea atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @airfare }
      else
        format.html { render :edit }
        format.json { render json: @airfare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airfares/1
  # DELETE /airfares/1.json
  def destroy
    @airfare.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Passagem Aérea excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airfare
      @airfare =LandingPage::Airfare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airfare_params
      params.require(:airfare).permit(:title, :phrase, :link)
    end
end
