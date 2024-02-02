# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードの作成'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount_amount = rand(10..100) * 10
      PromotionCode.create!(code:, discount_amount:)
    end
  end
end
