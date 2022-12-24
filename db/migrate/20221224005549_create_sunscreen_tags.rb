class CreateSunscreenTags < ActiveRecord::Migration[7.0]
  def change
    create_table :sunscreen_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :sunscreen, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sunscreen_tags, [:tag_id, :sunscreen_id], unique: true
  end
end
