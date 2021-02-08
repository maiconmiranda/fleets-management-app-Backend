class DailyTrack < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :company
  has_many :daily_reports
  has_many :incidents
end
