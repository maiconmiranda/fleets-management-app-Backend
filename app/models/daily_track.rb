class DailyTrack < ApplicationRecord
  validates :odometer_start, presence: true
  validates :odometer_end, presence: true
  belongs_to :user
  belongs_to :vehicle
  has_many :daily_reports
  has_many :incidents
end
