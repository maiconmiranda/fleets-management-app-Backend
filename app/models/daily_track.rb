class DailyTrack < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  has_many :daily_reports
end
