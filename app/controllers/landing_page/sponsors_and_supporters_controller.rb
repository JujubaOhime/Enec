class LandingPage::SponsorsAndSupportersController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_sponsors_and_supporter, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /sponsors_and_supporters
  # GET /sponsors_and_supporters.json
  def index
    @sponsors_and_supporters =LandingPage::SponsorsAndSupporter.all
    @sponsor_supporters_title =LandingPage::SponsorsAndSupportersTitle.all.first
  end

  # GET /sponsors_and_supporters/1
  # GET /sponsors_and_supporters/1.json
  def show
  end

  # GET /sponsors_and_supporters/new
  def new
    @sponsors_and_supporter =LandingPage::SponsorsAndSupporter.new
  end

  # GET /sponsors_and_supporters/1/edit
  def edit
  end

  # POST /sponsors_and_supporters
  # POST /sponsors_and_supporters.json
  def create
    @sponsors_and_supporter =LandingPage::SponsorsAndSupporter.new(sponsors_and_supporter_params)

    respond_to do |format|
      if @sponsors_and_supporter.save
        format.html { redirect_to sections_edit_path, notice: 'Patrocinador ou Apoiador criado com sucesso.' }
        format.json { render :show, status: :created, location: @sponsors_and_supporter }
      else
        format.html { render :new }
        format.json { render json: @sponsors_and_supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors_and_supporters/1
  # PATCH/PUT /sponsors_and_supporters/1.json
  def update
    respond_to do |format|
      if @sponsors_and_supporter.update(sponsors_and_supporter_params)
        format.html { redirect_to sections_edit_path, notice: 'Patrocinador ou Apoiador atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @sponsors_and_supporter }
      else
        format.html { render :edit }
        format.json { render json: @sponsors_and_supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors_and_supporters/1
  # DELETE /sponsors_and_supporters/1.json
  def destroy
    @sponsors_and_supporter.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Patrocinador ou Apoiador excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsors_and_supporter
      @sponsors_and_supporter =LandingPage::SponsorsAndSupporter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsors_and_supporter_params
      params.require(:sponsors_and_supporter).permit(:image, :link)
    end
end
