# frozen_string_literal: true

module SessionsHelper
  def log_in?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
