class AddPrefectureToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :prefecture, null: false, foreign_key: true, default: 48
  end
end
