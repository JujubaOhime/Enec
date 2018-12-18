class LandingPage::EventRealizersTitlesController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_event_realizers_title, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /event_realizers_titles
  # GET /event_realizers_titles.json
  def index
    @event_realizers_titles = LandingPage::EventRealizersTitle.all
  end

  # GET /event_realizers_titles/1
  # GET /event_realizers_titles/1.json
  def show
  end

  # GET /event_realizers_titles/new
  def new
    @event_realizers_title = LandingPage::EventRealizersTitle.new
  end

  # GET /event_realizers_titles/1/edit
  def edit
  end

  # POST /event_realizers_titles
  # POST /event_realizers_titles.json
  def create
    @event_realizers_title = LandingPage::EventRealizersTitle.new(event_realizers_title_params)

    respond_to do |format|
      if @event_realizers_title.save
        format.html { redirect_to sections_edit_path, notice: 'Título de Realizadores do Evento criado com sucesso.' }
        format.json { render :show, status: :created, location: @event_realizers_title }
      else
        format.html { render :new }
        format.json { render json: @event_realizers_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_realizers_titles/1
  # PATCH/PUT /event_realizers_titles/1.json
  def update
    respond_to do |format|
      if @event_realizers_title.update(event_realizers_title_params)
        format.html { redirect_to sections_edit_path, notice: 'Título de Realizadores do Evento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @event_realizers_title }
      else
        format.html { render :edit }
        format.json { render json: @event_realizers_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_realizers_titles/1
  # DELETE /event_realizers_titles/1.json
  def destroy
    @event_realizers_title.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Título de Realizadores do Evento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_realizers_title
      @event_realizers_title = LandingPage::EventRealizersTitle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_realizers_title_params
      params.require(:event_realizers_title).permit(:title)
    end
end
