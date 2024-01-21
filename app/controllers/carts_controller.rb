class CartsController < ApplicationController
    def index
        @cart_item_arry = []
        @item_amount = []
        @total_price = 0
        cart_item_amount = current_cart.cart_items.group(:item_id).sum(:amount)
        keys = cart_item_amount.keys
        keys.each do |key|
            item =current_cart.items.find_by(id: key)
            @cart_item_arry << item
            @item_amount << cart_item_amount[key]
            @total_price += item.price * cart_item_amount[key]
        end
    end
    
    def create
        @cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
        if params[:cart_item].blank?
            @cart_item.amount += 1
        else
            @cart_item.amount += params[:cart_item][:amount].to_i
        end
        
        if @cart_item.save
            flash[:notice] = "商品ID#{params[:item_id]}が追加されました"
            redirect_to root_path
        else
            flash[:danger] = '追加に失敗しました'
            redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        cart_item = current_cart.cart_items.where(item_id: params[:id])
        if cart_item.destroy_all
            flash[:notice] = '商品が削除されました'
            redirect_back(fallback_location: root_path)
        else
            flash[:danger] = '商品の削除に失敗しました'
            redirect_back(fallback_location: root_path)
        end
    end
end
