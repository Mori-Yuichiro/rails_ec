class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy

    with_options presence: true do
        validates :first_name
        validates :last_name
        validates :user_name
        validates :address
        validates :country
        validates :prefecture
        validates :zip, format: {
          with: /\A[0-9]{3}-[0-9]{4}\z/,
          message: '郵便番号の書式が違います'
        }
        validates :name_on_card, format: {
          with:  /\A[a-zA-Z]+\s[a-zA-Z]+\z/,
          message: 'カードの名義は英文字のみが使えます'
        }
        validates :card_number, length: {is: 16}
        validates :expiration, format: {
          with:  /\A\d{4}-\d{2}-\d{2}\z/,
          message: 'YYYY-mm-ddの書式で入力してください'
        }
        validates :cvv, length: {is: 3}
      end
    
      validates :email, format: {
        with: /\A[a-zA-Z0-9]+@[a-zA-Z0-9.]+\.[a-z]+\z/,
        message: 'メールの書式が違います。'
      }
end
