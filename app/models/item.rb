# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :yomi
    validates :price
    validates :description
  end
end
