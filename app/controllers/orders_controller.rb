class OrdersController < ApplicationController
    before_action :basic_auth, only: %i[index show]

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find_by(id: params[:id])
        @order_details = @order.order_details.all
    end
    
    def create
        order = Order.new(billing_param)
        order.total_price = session[:total_price]
        cart_items = session[:cart_items]
        if order.save
            create_order_detail(order, cart_items)
            OrderMailer.with(order: order).order_email.deliver_now
            flash[:notice] = '購入ありがとうございます'
            redirect_to root_path
        else
            flash[:danger] = '購入処理に失敗しました'
            redirect_back(fallback_location: root_path)
        end
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
        cart_items.each.with_index do |item, i|
            order.order_details.create(
                item_name: item['name'],
                price: item['price'],
                amount: session[:item_amount][i]
            )
            current_cart.cart_items.where(item_id: item['id']).delete_all
        end
    end

    def basic_auth
        authenticate_or_request_with_http_basic do |admin, pw|
          admin == ENV['BASIC_AUTH_USER'] && pw == ENV['BASIC_AUTH_PASSWORD']
        end
    end
end
