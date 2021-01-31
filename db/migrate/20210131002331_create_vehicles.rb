class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :fleet_id
      t.string :make
      t.string :model
      t.string :year
      t.string :color
      t.string :rego
      t.date :rego_expiry_date
      t.decimal :rego_fee
      t.string :insurance_provider
      t.string :insurance_police_number
      t.date :insurance_expiry_date
      t.decimal :insurance_fee
      t.decimal :maintenance_fee
      t.boolean :is_selected, default: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
