class CreateDailyTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_tracks do |t|
      t.date :date
      t.integer :odometer_start
      t.integer :odometer_end
      t.decimal :fuel_fee
      t.decimal :parking_fee
      t.decimal :fines
      t.decimal :other_fee
      t.text :other_fee_description
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
