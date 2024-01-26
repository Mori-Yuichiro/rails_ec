# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email
    @order = params[:order]
    @order_details = @order.order_details.all
    mail(to: @order.email, subject: 'ご注文ありがとうございました')
  end
end
