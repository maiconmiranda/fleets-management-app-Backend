class Company < ApplicationRecord
    validates :company_name, presence: true
    validates :email, presence: true
    validates :manager_name, presence: true
    validates :abn, presence: true 
    validates :contact_number, presence: true
    has_many :vehicles
    has_many :users
end
