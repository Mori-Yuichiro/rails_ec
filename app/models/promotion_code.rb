# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  with_options presence: true do
    validates :code, format: {
      with: /\A[a-zA-Z0-9]{7}\z/,
      message: 'プロモーションコードは7桁の英数字です'
    }
    validates :discount_amount, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 100,
      less_than_or_equal_to: 1000
    }
  end
end
