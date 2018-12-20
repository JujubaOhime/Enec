class ParcelsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update_status
  before_action do
    needs_to_be_admin("Você não tem permissão para isso!")
  end
  before_action :set_parcel, only: [:show, :edit, :update, :destroy, :update_status]
  # before_action :admin_only, only: [:show, :edit, :update, :destroy]

  # GET /parcels
  # GET /parcels.json
  def index
    @parcels = Parcel.all
  end

  # GET /parcels/1
  # GET /parcels/1.json
  def show
  end

  # GET /parcels/new
  def new
    @parcel = Parcel.new
  end

  # GET /parcels/1/edit
  def edit
  end

  # POST /parcels
  # POST /parcels.json
  def create
    @parcel = Parcel.new(parcel_params)

    respond_to do |format|
      if @parcel.save
        format.html { redirect_to @parcel, notice: 'Parcela criada com sucesso.' }
        format.json { render :show, status: :created, location: @parcel }
      else
        format.html { render :new }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parcels/1
  # PATCH/PUT /parcels/1.json
  def update
    respond_to do |format|
      if @parcel.update(parcel_params)
        format.html { redirect_to @parcel, notice: 'Parcela atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @parcel }
      else
        format.html { render :edit }
        format.json { render json: @parcel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1
  # DELETE /parcels/1.json
  def destroy
    @parcel.destroy
    respond_to do |format|
      format.html { redirect_to parcels_url, notice: 'Parcela excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  def update_status
    if @parcel.update(status: params[:new_status])
      @status_updated = true
    else
      @status_updated = false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parcel
      @parcel = Parcel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parcel_params
      parameters = params.require(:parcel).permit(:payment_id, :value, :status)
      parameters[:value] = monetary_string_to_decimal(parameters[:value])
      return parameters
    end
end
