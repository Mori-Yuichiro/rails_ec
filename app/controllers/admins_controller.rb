class AdminsController < ApplicationController
    before_action :require_login, only: %i[index edit]
    before_action :set_target_item, only: %i[edit update destroy]

    def login
    end

    def index
        @items = Item.order('yomi')
    end

    def new
        @item = Item.new
    end

    def create
        item = Item.new(admin_item_params)
        if item.save
            flash[:notice] = '登録に成功しました。'
            redirect_to admins_path
        else
            flash[:danger] = '登録に失敗しました。'
            redirect_back(fallback_location: admins_path)
        end
    end

    def edit
    end

    def update
        if @item.update(admin_item_params)
            flash[:notice] = '編集に成功しました。'
            redirect_to admins_path
        else
            flash[:danger] = '編集に失敗しました。'
            redirect_back(fallback_location: admins_path)
        end
    end

    def destroy
        if @item.delete
            flash[:notice] = '商品を削除しました。'
            redirect_to admins_path
        else
            flash[:danger] = '商品の削除に失敗しました。'
            redirect_back(fallback_location: admins_path)
        end
    end

    private
    
    def admin_item_params
        params.require(:item).permit(:name, :yomi, :price, :description, :image)
    end

    def set_target_item
        @item = Item.find_by(id: params[:id])
    end

end
