# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def index
    @promotion_codes = PromotionCode.all
  end

  def create
    redeem_promotion_code if params[:promotion_code]
  end

  private

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

  def promotion_param
    params.require(:promotion_code).permit(:code)
  end
end
