FactoryBot.define do
  factory :daily_track do
    sequence :odometer_start do |n|
        " 50.#{n}#{n}#{n}"
    end

    sequence :odometer_end do |n|
      " 50.1#{n}#{n}"
    end
    
    sequence :fuel_fee do |n|
      "1#{n}#{n}.00"
    end

    sequence :parking_fee do |n|
      "1#{n}#{n}.00"
    end

    sequence :fines do |n|
      "1#{n}#{n}.00"
    end

    sequence :other_fee do |n|
      "1#{n}#{n}.00"
    end

    sequence :other_fee_description do |n|
      "Other fee description #{n}"
    end

    association :user
    association :vehicle

  end
end
