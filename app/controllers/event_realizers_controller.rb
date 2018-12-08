class EventRealizersController < ApplicationController
  before_action :set_event_realizer, only: [:show, :edit, :update, :destroy]

  # GET /event_realizers
  # GET /event_realizers.json
  def index
    @event_realizers = EventRealizer.all
  end

  # GET /event_realizers/1
  # GET /event_realizers/1.json
  def show
  end

  # GET /event_realizers/new
  def new
    @event_realizer = EventRealizer.new
  end

  # GET /event_realizers/1/edit
  def edit
  end

  # POST /event_realizers
  # POST /event_realizers.json
  def create
    @event_realizer = EventRealizer.new(event_realizer_params)

    respond_to do |format|
      if @event_realizer.save
        format.html { redirect_to sections_edit_path, notice: 'Event realizer was successfully created.' }
        format.json { render :show, status: :created, location: @event_realizer }
      else
        format.html { render :new }
        format.json { render json: @event_realizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_realizers/1
  # PATCH/PUT /event_realizers/1.json
  def update
    respond_to do |format|
      if @event_realizer.update(event_realizer_params)
        format.html { redirect_to sections_edit_path, notice: 'Event realizer was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_realizer }
      else
        format.html { render :edit }
        format.json { render json: @event_realizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_realizers/1
  # DELETE /event_realizers/1.json
  def destroy
    @event_realizer.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'Event realizer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_realizer
      @event_realizer = EventRealizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_realizer_params
      params.require(:event_realizer).permit(:image, :name, :description, :link)
    end
end
