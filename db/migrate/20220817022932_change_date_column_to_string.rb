class ChangeDateColumnToString < ActiveRecord::Migration[6.1]
  def up
    change_column(:working_days, :date, :string)
  end

  def down
    change_column(:working_days, :date, :datetime)
  end
end
