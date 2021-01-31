class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :user_name
      t.string :driver_license_number
      t.date :driver_license_expiry
      t.references :company, null: false, foreign_key: true
      t.string :driver_id
      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
