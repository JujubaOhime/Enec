class LandingPage::MerchandisingVideosController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_merchandising_video, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /merchandising_videos
  # GET /merchandising_videos.json
  def index
    @merchandising_videos =LandingPage::MerchandisingVideo.all
  end

  # GET /merchandising_videos/1
  # GET /merchandising_videos/1.json
  def show
  end

  # GET /merchandising_videos/new
  def new
    @merchandising_video =LandingPage::MerchandisingVideo.new
  end

  # GET /merchandising_videos/1/edit
  def edit
  end

  # POST /merchandising_videos
  # POST /merchandising_videos.json
  def create
    @merchandising_video =LandingPage::MerchandisingVideo.new(merchandising_video_params)

    respond_to do |format|
      if @merchandising_video.save
        format.html { redirect_to sections_edit_path, notice: 'Video de Divulgação criado com sucesso.' }
        format.json { render :show, status: :created, location: @merchandising_video }
      else
        format.html { render :new }
        format.json { render json: @merchandising_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchandising_videos/1
  # PATCH/PUT /merchandising_videos/1.json
  def update
    respond_to do |format|
      if @merchandising_video.update(merchandising_video_params)
        format.html { redirect_to sections_edit_path, notice: 'Video de Divulgação atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @merchandising_video }
      else
        format.html { render :edit }
        format.json { render json: @merchandising_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchandising_videos/1
  # DELETE /merchandising_videos/1.json
  def destroy
    @merchandising_video.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Video de Divulgação excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandising_video
      @merchandising_video =LandingPage::MerchandisingVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchandising_video_params
      params.require(:merchandising_video).permit(:title, :video)
    end
end
