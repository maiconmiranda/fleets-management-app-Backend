# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

require "faker"


# Create company
10.times do 
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

# user admin or company by id 1
User.create(
    
    email: Company.find_by(id: 1).email,
    password: "password",
    user_name: Company.find_by(id: 1).company_name,
    driver_license_number: Faker::DrivingLicence.usa_driving_licence,
    # driver_license_expiry: Faker::Date.in_date_period(year: 2022, month: 11),
    company_id: 1,
    driver_id: Faker::IDNumber.valid
)
