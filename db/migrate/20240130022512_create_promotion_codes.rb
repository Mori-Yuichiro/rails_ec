# frozen_string_literal: true

class CreatePromotionCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotion_codes do |t|
      t.string :code, null: false
      t.integer :discount_amount, null: false
      t.boolean :used, default: false

      t.timestamps
    end
  end
end
