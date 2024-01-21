# frozen_string_literal: true

class AddAmountToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :amount, :integer, default: 0
  end
end
