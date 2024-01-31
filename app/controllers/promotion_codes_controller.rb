# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def index
    @promotion_codes = PromotionCode.all
  end
end
