class DailyReport < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  belongs_to :daily_track
  belongs_to :company
end
