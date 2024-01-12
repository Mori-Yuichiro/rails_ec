# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :yomi
    validates :price
    validates :description
  end
end
