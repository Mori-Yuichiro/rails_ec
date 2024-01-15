# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name,
            presence: true,
            uniqueness: true

  validates :password,
            length: { minimum: 8 },
            format: {
              with: /\A[a-zA-Z0-9]+\z/,
              message: '8文字以上の英数字を入力してください。'
            }
end
