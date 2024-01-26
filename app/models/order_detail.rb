# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :item_name
    validates :price
  end
end
