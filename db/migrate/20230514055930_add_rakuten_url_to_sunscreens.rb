class AddRakutenUrlToSunscreens < ActiveRecord::Migration[7.0]
  def change
    add_column :sunscreens, :rakuten_url, :text
    add_column :sunscreens, :rakuten_image_url, :text
  end
end
