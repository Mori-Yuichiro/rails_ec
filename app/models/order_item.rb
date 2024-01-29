# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :item_name
    validates :price
  end
end
