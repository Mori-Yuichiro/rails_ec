# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :basic_auth, only: %i[index show]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
    @order_items = @order.order_items
  end

  def create
    params[:promotion_code] ? redeem_promotion_code : create_order
  end

  private

  def billing_param
    params.require(:order).permit(
      :first_name,
      :last_name,
      :user_name,
      :email,
      :address,
      :address2,
      :country,
      :prefecture,
      :zip,
      :name_on_card,
      :card_number,
      :expiration,
      :cvv
    )
  end

  def create_order_detail(order, cart_items)
    cart_items.each.with_index do |item, _i|
      Rails.logger.debug item[:amount]
      order.order_items.create!(
        item_name: item[:name],
        price: item[:price],
        amount: item[:amount]
      )
      current_cart.cart_items.where(cart_id: session[:cart_id]).delete_all
    end
  end

  def create_order
    cart_items = group_by_items
    return if cart_items.empty?

    ActiveRecord::Base.transaction do
      order = Order.new(billing_param)
      order.total_price = calc_total_price(cart_items)
      order.discount = session[:discount] if session[:discount]
      order.save!
      create_order_detail(order, cart_items)
      OrderMailer.with(order:).order_email.deliver_now
      update_promotion_code if session[:promotion_code_id]
      clear_promotion_session
      flash[:notice] = '購入ありがとうございます'
      redirect_to root_path
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = '購入処理に失敗しました'
    redirect_back(fallback_location: root_path)
  end

  def group_by_items
    current_cart.cart_items.group_by(&:item).map do |k, v|
      amount = v.reduce(0) { |sum, item| sum + item.amount }
      { name: k.name, price: k.price, amount: }
    end
  end

  def calc_total_price(cart_items)
    total_price = 0
    cart_items.each do |item|
      total_price += item[:price] * item[:amount]
    end
    session[:discount] ? total_price - session[:discount] : total_price
  end

  def redeem_promotion_code
    promotion_code = PromotionCode.find_by(promotion_param)
    if promotion_code && !promotion_code.used
      discount = promotion_code.discount_amount
      session[:discount] = discount
      session[:promotion_code_id] = promotion_code.id
      flash[:notice] = 'プロモーションコードを適用しました'
    end
    redirect_back(fallback_location: root_path)
  end

  def update_promotion_code
    promotion_code = PromotionCode.find_by(id: session[:promotion_code_id])
    promotion_code.update!(used: true)
  end

  def clear_promotion_session
    session.delete(:discount) if session[:discount]
    session.delete(:promotion_code_id) if session[:promotion_code_id]
  end

  def promotion_param
    params.require(:promotion_code).permit(:code)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |admin, pw|
      admin == ENV['BASIC_AUTH_USER'] && pw == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
