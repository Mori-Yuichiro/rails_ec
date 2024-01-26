class AddColumnsOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :first_name, :string, null: false
    add_column :orders, :last_name, :string, null: false
    add_column :orders, :user_name, :string, null: false
    add_column :orders, :email, :string
    add_column :orders, :address, :string, null: false
    add_column :orders, :address2, :string
    add_column :orders, :country, :string, null: false
    add_column :orders, :prefecture, :string, null: false
    add_column :orders, :zip, :string, null: false
    add_column :orders, :name_on_card, :string, null: false
    add_column :orders, :card_number, :string, null: false
    add_column :orders, :expiration, :string, null: false
    add_column :orders, :cvv, :string, null: false
  end
end
