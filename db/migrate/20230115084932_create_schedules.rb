class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true
      t.references :odekake_type, null: false, foreign_key: true
      t.datetime :leave_home_time, null: false

      t.timestamps
    end
  end
end
