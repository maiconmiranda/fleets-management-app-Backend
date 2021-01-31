class Company < ApplicationRecord
    has_many :vehicles
    has_many :users
end
