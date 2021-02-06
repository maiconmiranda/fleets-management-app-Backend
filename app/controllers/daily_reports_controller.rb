class DailyReportsController < ApplicationController
  before_action :authenticate_user
  before_action :set_daily_report, only: [:show, :update, :destroy]

  # GET /daily_reports
  def index
    @daily_reports = current_user.daily_reports

    render json: @daily_reports
  end

  # GET /daily_reports/1
  def show
    render json: @daily_report
  end

  # POST /daily_reports
  def create
    @daily_report = DailyReport.new(daily_report_params)
    @daily_report.user_id = current_user.id

    if @daily_report.save
      render json: @daily_report, status: :created, location: @daily_report
    else
      render json: @daily_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /daily_reports/1
  def update
    if @daily_report.update(daily_report_params)
      render json: @daily_report
    else
      render json: @daily_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /daily_reports/1
  def destroy
    @daily_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = Daily_report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_report_params
      params.require(:daily_report).permit(
        :description, :vehicle_id, :user_id, :daily_track_id
      )
    end
end
