# frozen_string_literal: true

class SessionsController < ApplicationController
  def index; end

  def create
    user = User.find_by(name: params[:session][:name])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'ログインしました。'
      redirect_to admins_path
    else
      flash.now[:danger] = '名前またはパスワードが間違っています。'
      render 'sessions/index', status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました。'
    redirect_to login_path
  end
end
