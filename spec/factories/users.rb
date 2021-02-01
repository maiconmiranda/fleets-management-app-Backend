FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@test.com"
  end
    password { "password" }
    sequence :user_name do |n|
      "User name #{n}"
    end
    sequence :driver_license_number do |n|
      "0000#{n}"
    end
    driver_license_expiry {Time.current + 200.days}
    association :company

    sequence :driver_id do |n|
      "C#{n}"
    end

    trait :invalid do
      email { nil }
    end
  end
end
