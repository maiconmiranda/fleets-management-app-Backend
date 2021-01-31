class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  belongs_to :company
  has_many :daily_tracks
  has_many :daily_reports
  has_many :vehicles
end
