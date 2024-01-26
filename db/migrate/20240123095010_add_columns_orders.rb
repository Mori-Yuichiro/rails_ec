# frozen_string_literal: true

class AddColumnsOrders < ActiveRecord::Migration[7.0]
  def change
    change_table :orders, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :address
      t.string :address2
      t.string :country
      t.string :prefecture
      t.string :zip
      t.string :name_on_card
      t.string :card_number
      t.string :expiration
      t.string :cvv
    end
  end
end
