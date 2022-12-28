class AddBrandsToSunscreens < ActiveRecord::Migration[7.0]
  def change
    add_column :sunscreens, :brand, :string, null: false
  end
end
