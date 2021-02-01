FactoryBot.define do
  factory :vehicle do
    sequence :fleet_id do |n|
        "Test fleet#{n}"
    end

    make { 'Honda' }
    model { 'Civic' }
    year { '2019' }
    color { 'Black' }
    rego { 'YA25YA' }
    rego_fee { '535.00' }
    insurance_provider { 'Allianz' }
    association :company
    association :user


end
end
