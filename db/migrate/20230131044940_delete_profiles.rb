class DeleteProfiles < ActiveRecord::Migration[7.0]
  def change
    drop_table :profiles
  end
end
