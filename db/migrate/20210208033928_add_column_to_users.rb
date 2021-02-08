class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_chosen, :boolean, default: false
  end
end
