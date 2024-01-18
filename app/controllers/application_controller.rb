# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :admin_page?

  private

  # def require_login
  #   return if log_in?

  #   redirect_to login_path
  # end

  def admin_page?
    @is_admin_page = false
    full_path = request.fullpath

    return unless full_path.include?('admin')

    @is_admin_page = true
  end
end
