class Company < ApplicationRecord
    validates :company_name, presence: true
    validates :company_name, uniqueness: true
    validates :email, presence: true
    validates :manager_name, presence: true
    validates :abn, presence: true 
    validates :contact_number, presence: true
    has_many :vehicles
    has_many :users
    has_many :daily_tracks
    has_many :daily_reports
    has_many :incidents
end
