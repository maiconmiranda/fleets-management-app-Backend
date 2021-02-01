class DailyReport < ApplicationRecord
  validates :description, presence: true
  belongs_to :vehicle
  belongs_to :user
  belongs_to :daily_track
end
