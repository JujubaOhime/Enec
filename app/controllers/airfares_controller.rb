class AirfaresController < ApplicationController
  before_action :set_airfare, only: [:show, :edit, :update, :destroy]

  # GET /airfares
  # GET /airfares.json
  def index
    @airfares = Airfare.all
  end

  # GET /airfares/1
  # GET /airfares/1.json
  def show
  end

  # GET /airfares/new
  def new
    @airfare = Airfare.new
  end

  # GET /airfares/1/edit
  def edit
  end

  # POST /airfares
  # POST /airfares.json
  def create
    @airfare = Airfare.new(airfare_params)

    respond_to do |format|
      if @airfare.save
        format.html { redirect_to sections_edit_path, notice: 'Airfare was successfully created.' }
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
        format.html { redirect_to sections_edit_path, notice: 'Airfare was successfully updated.' }
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
      format.html { redirect_to sections_edit_path, notice: 'Airfare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airfare
      @airfare = Airfare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def airfare_params
      params.require(:airfare).permit(:title, :phrase)
    end
end
