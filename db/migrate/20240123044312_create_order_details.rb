# frozen_string_literal: true

class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :amount, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
