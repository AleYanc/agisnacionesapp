class CreateWorkingDays < ActiveRecord::Migration[6.1]
  def change
    create_table :working_days do |t|
      t.string :day
      t.datetime :date
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
