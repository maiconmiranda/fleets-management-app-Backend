FactoryBot.define do
  factory :daily_report do
    sequence :description do |n|
      "Daily report description #{n}"
    end
    association :user
    association :vehicle
    association :daily_track

  end
end
