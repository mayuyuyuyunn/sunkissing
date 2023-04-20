class RemovePrefectureFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :prefecture, :integer
  end
end
