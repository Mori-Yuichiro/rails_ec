class AddToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :item_name, :string, null: false
    add_column :order_details, :price, :integer, null: false
  end
end
