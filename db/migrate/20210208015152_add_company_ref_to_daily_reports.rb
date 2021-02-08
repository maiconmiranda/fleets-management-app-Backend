class AddCompanyRefToDailyReports < ActiveRecord::Migration[6.1]
  def change
    add_reference :daily_reports, :company, null: false, foreign_key: true
  end
end
