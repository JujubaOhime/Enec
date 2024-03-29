class LandingPage::EventNoticesController < ApplicationController
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_event_notice, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /event_notices
  # GET /event_notices.json
  def index
    @event_notices =LandingPage::EventNotice.all
  end

  # GET /event_notices/1
  # GET /event_notices/1.json
  def show
  end

  # GET /event_notices/new
  def new
    @event_notice =LandingPage::EventNotice.new
  end

  # GET /event_notices/1/edit
  def edit
  end

  # POST /event_notices
  # POST /event_notices.json
  def create
    @event_notice =LandingPage::EventNotice.new(event_notice_params)

    respond_to do |format|
      if @event_notice.save
        format.html { redirect_to sections_edit_path, notice: 'Notícia do Evento criada com sucesso.' }
        format.json { render :show, status: :created, location: @event_notice }
      else
        format.html { render :new }
        format.json { render json: @event_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_notices/1
  # PATCH/PUT /event_notices/1.json
  def update
    respond_to do |format|
      if @event_notice.update(event_notice_params)
        format.html { redirect_to sections_edit_path, notice: 'Notícia do Evento atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @event_notice }
      else
        format.html { render :edit }
        format.json { render json: @event_notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_notices/1
  # DELETE /event_notices/1.json
  def destroy
    @event_notice.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Notícia do Evento excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_notice
      @event_notice =LandingPage::EventNotice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_notice_params
      params.require(:event_notice).permit(:title, :content, :image, :document)
    end
end
