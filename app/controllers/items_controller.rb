# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.order('yomi')
  end

  def show
    @item = Item.find(params[:id])
    @related_item = Item.order(created_at: :desc).where.not(id: params[:id]).first
  end
end
