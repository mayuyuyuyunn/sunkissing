class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :line_user_id, null: false, unique: true
      t.integer :role, null: false, default: 0

      t.timestamps
    end
  end
end
