# frozen_string_literal: true

class AddToOrderDetail < ActiveRecord::Migration[7.0]
  def change
    change_table :order_details, bulk: true do |t|
      t.string :item_name
      t.integer :price
    end
  end
end
