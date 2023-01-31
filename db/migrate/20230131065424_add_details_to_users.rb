class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer, null: false, default: 0
    add_column :users, :gender, :integer, null: false, default: 0
    add_column :users, :prefecture, :integer, null: false, default: 0
    add_column :users, :skin_type, :integer, null: false, default: 0
  end
end
