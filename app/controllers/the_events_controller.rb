class TheEventsController < ApplicationController
  before_action :set_the_event, only: [:show, :edit, :update, :destroy]

  # GET /the_events
  # GET /the_events.json
  def index
    @the_events = TheEvent.all
  end

  # GET /the_events/1
  # GET /the_events/1.json
  def show
  end

  # GET /the_events/new
  def new
    @the_event = TheEvent.new
  end

  # GET /the_events/1/edit
  def edit
  end

  # POST /the_events
  # POST /the_events.json
  def create
    @the_event = TheEvent.new(the_event_params)

    respond_to do |format|
      if @the_event.save
        format.html { redirect_to @the_event, notice: 'The event was successfully created.' }
        format.json { render :show, status: :created, location: @the_event }
      else
        format.html { render :new }
        format.json { render json: @the_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /the_events/1
  # PATCH/PUT /the_events/1.json
  def update
    respond_to do |format|
      if @the_event.update(the_event_params)
        format.html { redirect_to @the_event, notice: 'The event was successfully updated.' }
        format.json { render :show, status: :ok, location: @the_event }
      else
        format.html { render :edit }
        format.json { render json: @the_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /the_events/1
  # DELETE /the_events/1.json
  def destroy
    @the_event.destroy
    respond_to do |format|
      format.html { redirect_to the_events_url, notice: 'The event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_the_event
      @the_event = TheEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def the_event_params
      params.require(:the_event).permit(:title, :days, :content)
    end
end
