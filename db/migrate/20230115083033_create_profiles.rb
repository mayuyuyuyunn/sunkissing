class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false, unique: true
      t.integer :age, null: false, default: 0
      t.integer :skyn_type, null: false, default: 0
      t.integer :gender, null: false, default: 0
      t.integer :prefecture, null: false, default: 0

      t.timestamps
    end
  end
end
