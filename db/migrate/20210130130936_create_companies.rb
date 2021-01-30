class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :email
      t.string :manager_name
      t.string :abn
      t.string :website
      t.string :contact_number
      t.string :address
      t.string :suburb
      t.string :state

      t.timestamps
    end
  end
end
