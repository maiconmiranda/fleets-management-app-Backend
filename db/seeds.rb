# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require "faker"


# Create company
5.times do 
  company_name = Faker::Company.name
  company = Company.new(
    company_name: company_name,
    email: Faker::Internet.email(domain: company_name),
    manager_name: Faker::Name.name,
    abn: Faker::Company.australian_business_number,
    website: Faker::Internet.domain_name(domain: company_name),
    contact_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address,
    suburb:  "Melbourne",
    state: "Victoria"   
  )

  company.save
end

# user admin or user as company, by id 1
User.create(
    email: "admin@email.com",
    password: "password",
    user_name: Company.find_by(id: 1).company_name,
    driver_license_number: Faker::DrivingLicence.usa_driving_licence,
    driver_license_expiry: Faker::Date.forward(days: 260),
    company_id: 1,
    driver_id: Faker::IDNumber.valid,
    is_admin: true
)



# User as drivers
10.times do
user = User.new(
    email: Faker::Internet.email,
    password: "password",
    user_name: Company.find_by(id: 1).company_name,
    driver_license_number: Faker::DrivingLicence.usa_driving_licence,
    driver_license_expiry: Faker::Date.forward(days: 260),
    company_id: 1,
    driver_id: Faker::IDNumber.valid
)
user.save
end

# User as drivers for Company 2
10.times do
user = User.new(
    email: Faker::Internet.email,
    password: "password",
    user_name: Company.find_by(id: 1).company_name,
    driver_license_number: Faker::DrivingLicence.usa_driving_licence,
    driver_license_expiry: Faker::Date.forward(days: 260),
    company_id: 2,
    driver_id: Faker::IDNumber.valid
)
user.save
end


# Vehicle for company 1
10.times do 
    make = Faker::Vehicle.make
    Vehicle.create(
      fleet_id: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 1),
      make: make,
      model: Faker::Vehicle.model(make_of_model: make),
      year: Faker::Vehicle.year,
      color: Faker::Vehicle.color,
      rego: Faker::Vehicle.license_plate,
      rego_expiry_date: Faker::Date.forward(days: 260),
      rego_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      insurance_provider: "The Insurance Co",
      insurance_policy_number: Faker::Alphanumeric.alphanumeric(number: 10),
      insurance_expiry_date: Faker::Date.forward(days: 260),
      insurance_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      maintenance_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      company_id: 1,
      user_id: 1
    )
  end

  # Vehicle for company 2
5.times do 
    make = Faker::Vehicle.make
    Vehicle.create(
      fleet_id: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 1),
      make: make,
      model: Faker::Vehicle.model(make_of_model: make),
      year: Faker::Vehicle.year,
      color: Faker::Vehicle.color,
      rego: Faker::Vehicle.license_plate,
      rego_expiry_date: Faker::Date.forward(days: 260),
      rego_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      insurance_provider: "The Insurance Co",
      insurance_policy_number: Faker::Alphanumeric.alphanumeric(number: 10),
      insurance_expiry_date: Faker::Date.forward(days: 260),
      insurance_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      maintenance_fee: Faker::Number.decimal(l_digits: 3, r_digits: 2),
      company_id: 1,
      user_id: 1
    )
  end

  # Daily_track for vehicle one
10.times do
  odometer_start = Faker::Vehicle.mileage(min: 50_000, max: 80_000)
  odometer_end = odometer_start + rand(100..220) 

  daily_track = DailyTrack.new(
  date: Faker::Date.backward(days: 14),
  odometer_start: odometer_start,
  odometer_end: odometer_end,
  fuel_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  parking_fee: Faker::Number.decimal(l_digits: 1, r_digits: 2),
  fines: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  other_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  other_fee_description: Faker::ChuckNorris.fact,
  vehicle_id: 1,
  user_id: 2,
  company_id: 1
  )
  daily_track.save
end

# Daily_track for vehicle two
10.times do
  odometer_start = Faker::Vehicle.mileage(min: 50_000, max: 80_000)
  odometer_end = odometer_start + rand(100..220) 

  daily_track = DailyTrack.new(
  date: Faker::Date.backward(days: 14),
  odometer_start: odometer_start,
  odometer_end: odometer_end,
  fuel_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  parking_fee: Faker::Number.decimal(l_digits: 1, r_digits: 2),
  fines: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  other_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  other_fee_description: Faker::ChuckNorris.fact,
  vehicle_id: 2,
  user_id: 3,
  company_id: 1
  )
  daily_track.save
end

# Daily_track for vehicle 3 and user 2
5.times do
  odometer_start = Faker::Vehicle.mileage(min: 50_000, max: 80_000)
  odometer_end = odometer_start + rand(100..220) 

  daily_track = DailyTrack.new(
  date: Faker::Date.backward(days: 14),
  odometer_start: odometer_start,
  odometer_end: odometer_end,
  fuel_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  parking_fee: Faker::Number.decimal(l_digits: 1, r_digits: 2),
  fines: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  other_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  other_fee_description: Faker::ChuckNorris.fact,
  vehicle_id: 3,
  user_id: 2,
  company_id: 1
  )
  daily_track.save
end

# Daily_track for vehicle 3
10.times do
  odometer_start = Faker::Vehicle.mileage(min: 50_000, max: 80_000)
  odometer_end = odometer_start + rand(100..220) 

  daily_track = DailyTrack.new(
  date: Faker::Date.backward(days: 14),
  odometer_start: odometer_start,
  odometer_end: odometer_end,
  fuel_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  parking_fee: Faker::Number.decimal(l_digits: 1, r_digits: 2),
  fines: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  other_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  other_fee_description: Faker::ChuckNorris.fact,
  vehicle_id: 1,
  user_id: 4,
  company_id: 1
  )
  daily_track.save
end

# Daily_track for Company 2
10.times do
  odometer_start = Faker::Vehicle.mileage(min: 50_000, max: 80_000)
  odometer_end = odometer_start + rand(100..220) 

  daily_track = DailyTrack.new(
  date: Faker::Date.backward(days: 14),
  odometer_start: odometer_start,
  odometer_end: odometer_end,
  fuel_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  parking_fee: Faker::Number.decimal(l_digits: 1, r_digits: 2),
  fines: Faker::Number.decimal(l_digits: 3, r_digits: 2),
  other_fee: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  other_fee_description: Faker::ChuckNorris.fact,
  vehicle_id: 13,
  user_id: 14,
  company_id: 2
  )
  daily_track.save
end

#  Daily_report
5.times do
    daily_report = DailyReport.new(
        description: Faker::Movies::StarWars.quote,
        vehicle_id: 1,
        user_id: 2,
        daily_track_id: 1
    )
    daily_report.save
end

#  Incidents
2.times do
    incident = Incident.new(
        description: Faker::Movies::StarWars.quote,
        vehicle_id: 1,
        user_id: 2,
        daily_track_id: 1
    )
    incident.save
end

