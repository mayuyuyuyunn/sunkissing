class AddPrefectureIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :prefecture, null: false, foreign_key: true, default: 99
  end
end
