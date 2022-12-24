class CreateSunscreens < ActiveRecord::Migration[7.0]
  def change
    create_table :sunscreens do |t|
      t.text :name, null: false, unique: true
      t.string :manufacture, null: false
      t.integer :price, null: false
      t.integer :spf, null: false, default: 0
      t.integer :pa, null: false, default: 0
      t.text :summary, null: false
      t.integer :capacity

      t.timestamps
    end
    add_index :sunscreens, :name, unique: true
  end
end
