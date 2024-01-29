# frozen_string_literal: true

class ChangeOrderDetailsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :order_details, :order_items
  end
end
