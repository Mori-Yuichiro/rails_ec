class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'ログインしました。'
      redirect_to admins_path
    else
      flash.now[:danger] = '名前またはパスワードが間違っています。'
      render 'admins/login', status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました。'
    redirect_to login_path
  end
end
