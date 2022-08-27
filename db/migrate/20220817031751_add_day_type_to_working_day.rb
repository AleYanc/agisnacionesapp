class AddDayTypeToWorkingDay < ActiveRecord::Migration[6.1]
  def change
    add_column :working_days, :day_type, :string
  end
end
