class Vehicle < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :daily_tracks
  has_many :daily_reports
end
