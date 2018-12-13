class TheSpeakersController < ApplicationController
  before_action :set_the_speaker, only: [:show, :edit, :update, :destroy]
  # before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /the_speakers
  # GET /the_speakers.json
  def index
    @the_speakers = TheSpeaker.all
  end

  # GET /the_speakers/1
  # GET /the_speakers/1.json
  def show
  end

  # GET /the_speakers/new
  def new
    @the_speaker = TheSpeaker.new
  end

  # GET /the_speakers/1/edit
  def edit
  end

  # POST /the_speakers
  # POST /the_speakers.json
  def create
    @the_speaker = TheSpeaker.new(the_speaker_params)

    respond_to do |format|
      if @the_speaker.save
        format.html { redirect_to sections_edit_path, notice: 'The speaker was successfully created.' }
        format.json { render :show, status: :created, location: @the_speaker }
      else
        format.html { render :new }
        format.json { render json: @the_speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /the_speakers/1
  # PATCH/PUT /the_speakers/1.json
  def update
    respond_to do |format|
      if @the_speaker.update(the_speaker_params)
        format.html { redirect_to sections_edit_path, notice: 'The speaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @the_speaker }
      else
        format.html { render :edit }
        format.json { render json: @the_speaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /the_speakers/1
  # DELETE /the_speakers/1.json
  def destroy
    @the_speaker.destroy
    respond_to do |format|
      format.html { redirect_to sections_edit_path, notice: 'The speaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_the_speaker
      @the_speaker = TheSpeaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def the_speaker_params
      params.require(:the_speaker).permit(:title, :description, :image)
    end
end
