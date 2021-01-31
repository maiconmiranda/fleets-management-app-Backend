class VehiclesController < ApplicationController
  before_action :get_company
  before_action :set_vehicle, only: [:show, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = @company.vehicles

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  # POST /vehicles
  def create
    @vehicle = @company.vehicles.build(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private

  def get_company
    @company = Company.find(params[:company_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = @company.vehicles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:fleet_id, :make, :model, :year, :color, :rego, :rego_expiry_date, :rego_fee, :insurance_provider, :insurance_police_number, :insurance_expiry_date, :insurance_fee, :maintenance_fee, :is_selected, :company_id)
    end
end
