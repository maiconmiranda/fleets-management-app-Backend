class VehiclesController < ApplicationController
  before_action :authenticate_user
  before_action :set_vehicle, only: [:show, :update, :destroy]
  before_action :find_vehicle_by_company, only: [:show_vehicle_from_company]

  # GET /vehicles
  def index
    @vehicles = current_user.vehicles

    render json: @vehicles
  end

  # GET all vehicles that belongs to company
  def vehicles_company_all
    @user_company_vehicles = current_user.company.vehicles

    render json: @user_company_vehicles 
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

    # GET vehicle from company
    def show_vehicle_from_company
      render json: @vehicle_from_company
    end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = current_user.id
    
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
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

        # looks for vehicle that belongs to company
        def find_vehicle_by_company
          @vehicle_from_company = current_user.company.vehicles.where(id: params[:id])
        end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(
        :fleet_id, :make, :model, :year, :color, :rego, 
        :rego_expiry_date, :rego_fee, :insurance_provider, 
        :insurance_policy_number, :insurance_expiry_date, 
        :insurance_fee, :maintenance_fee, 
        :is_selected, :company_id, :user_id
      )
    end
end
