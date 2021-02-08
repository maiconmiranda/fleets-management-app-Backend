class IncidentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_incident, only: [:show, :update, :destroy]

  # GET /incidents
  def index
    @incidents = current_user.incidents

    render json: @incidents
  end

      # GET all incidents from the company
      def incidents_company_all
        @user_company_incidents = current_user.company.incidents
    
        render json: @user_company_incidents 
      end

  # GET /incidents/1
  def show
    render json: @incident
  end

  # POST /incidents
  def create
    @incident = Incident.new(incident_params)
    @incident.user_id = current_user.id
    if @incident.save
      render json: @incident, status: :created, location: @incident
    else
      render json: @incident.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /incidents/1
  def update
    if @incident.update(incident_params)
      render json: @incident
    else
      render json: @incident.errors, status: :unprocessable_entity
    end
  end

  # DELETE /incidents/1
  def destroy
    @incident.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def incident_params
      params.require(:incident).permit(:description, :vehicle_id, :user_id, :daily_track_id)
    end
end
