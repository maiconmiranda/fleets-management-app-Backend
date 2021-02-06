class DailyTracksController < ApplicationController
  before_action :authenticate_user
  before_action :set_daily_track, only: [:show, :update, :destroy]

  # GET /daily_tracks
  def index
    @daily_tracks = current_user.daily_tracks

    render json: @daily_tracks
  end

  # GET /daily_tracks/1
  def show
    render json: @daily_track
  end

  # POST /daily_tracks
  def create
    @daily_track = DailyTrack.new(daily_track_params)
    @daily_track.user_id = current_user.id

    if @daily_track.save
      render json: @daily_track, status: :created, location: @daily_track
    else
      render json: @daily_track.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daily_tracks/1
  def update
    if @daily_track.update(daily_track_params)
      render json: @daily_track
    else
      render json: @daily_track.errors, status: :unprocessable_entity
    end
  end

  # DELETE /daily_tracks/1
  def destroy
    @daily_track.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_track
      @daily_track = DailyTrack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_track_params
      params.require(:daily_track).permit(
        :date, :odometer_start, :odometer_end, :fuel_fee, 
        :parking_fee, :fines, :other_fee, :other_fee_description, 
        :user_id, :vehicle_id
      )
    end
end
