class SponsorsAndSupportersTitlesController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_sponsors_and_supporters_title, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /sponsors_and_supporters_titles
  # GET /sponsors_and_supporters_titles.json
  def index
    @sponsors_and_supporters_titles = SponsorsAndSupportersTitle.all
  end

  # GET /sponsors_and_supporters_titles/1
  # GET /sponsors_and_supporters_titles/1.json
  def show
  end

  # GET /sponsors_and_supporters_titles/new
  def new
    @sponsors_and_supporters_title = SponsorsAndSupportersTitle.new
  end

  # GET /sponsors_and_supporters_titles/1/edit
  def edit
  end

  # POST /sponsors_and_supporters_titles
  # POST /sponsors_and_supporters_titles.json
  def create
    @sponsors_and_supporters_title = SponsorsAndSupportersTitle.new(sponsors_and_supporters_title_params)

    respond_to do |format|
      if @sponsors_and_supporters_title.save
        format.html { redirect_to sections_edit_path, notice: 'Título de Patrocinadores e Apoiadores criado com sucesso.' }
        format.json { render :show, status: :created, location: @sponsors_and_supporters_title }
      else
        format.html { render :new }
        format.json { render json: @sponsors_and_supporters_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors_and_supporters_titles/1
  # PATCH/PUT /sponsors_and_supporters_titles/1.json
  def update
    respond_to do |format|
      if @sponsors_and_supporters_title.update(sponsors_and_supporters_title_params)
        format.html { redirect_to sections_edit_path, notice: 'Título de Patrocinadores e Apoiadores atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @sponsors_and_supporters_title }
      else
        format.html { render :edit }
        format.json { render json: @sponsors_and_supporters_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors_and_supporters_titles/1
  # DELETE /sponsors_and_supporters_titles/1.json
  def destroy
    @sponsors_and_supporters_title.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Título de Patrocinadores e Apoiadores excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsors_and_supporters_title
      @sponsors_and_supporters_title = SponsorsAndSupportersTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsors_and_supporters_title_params
      params.require(:sponsors_and_supporters_title).permit(:title)
    end
end
