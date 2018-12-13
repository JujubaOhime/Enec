class IEsController < ApplicationController
  before_action :set_ie, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, only: [:edit, :update, :destroy]

  # GET /ies
  # GET /ies.json
  def index
    @ies = Ies.all
  end

  # GET /ies/1
  # GET /ies/1.json
  def show
  end

  # GET /ies/new
  def new
    @ie = Ies.new
  end

  # GET /ies/1/edit
  def edit
  end

  # POST /ies
  # POST /ies.json
  def create
    @ie = Ies.new(ie_params)

    respond_to do |format|
      if @ie.save
        format.html { redirect_to @ie, notice: 'Ies was successfully created.' }
        format.json { render :show, status: :created, location: @ie }
      else
        format.html { render :new }
        format.json { render json: @ie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ies/1
  # PATCH/PUT /ies/1.json
  def update
    respond_to do |format|
      if @ie.update(ie_params)
        format.html { redirect_to @ie, notice: 'Ies was successfully updated.' }
        format.json { render :show, status: :ok, location: @ie }
      else
        format.html { render :edit }
        format.json { render json: @ie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ies/1
  # DELETE /ies/1.json
  def destroy
    @ie.destroy
    respond_to do |format|
      format.html { redirect_to ies_index_url, notice: 'Ies was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ie
      @ie = Ies.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ie_params
      params.require(:ie).permit(:name, :city)
    end
end
