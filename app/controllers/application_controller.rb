# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :admin_page?
  before_action :set_amount

  private

  def admin_page?
    @is_admin_page = false
    full_path = request.fullpath

    return unless full_path.include?('admin')

    @is_admin_page = true
  end

  def current_cart
    cart = Cart.find_by(id: session[:cart_id])
    cart ||= Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def set_amount
    @amount = current_cart.cart_items.all.sum(:amount)
  end
end
