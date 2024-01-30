# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email
    @order = params[:order]
    @order_items = @order.order_items.all
    mail(to: @order.email, subject: 'ご注文ありがとうございました')
  end
end
