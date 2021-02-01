FactoryBot.define do
  factory :incident do
    sequence :description do |n|
      "Incident description #{n}"
    end
    association :user
    association :vehicle
    association :daily_track

  end
end
