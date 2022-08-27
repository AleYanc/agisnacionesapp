class AddTimeToWorkingDay < ActiveRecord::Migration[6.1]
  def change
    add_column :working_days, :time, :string
  end
end
