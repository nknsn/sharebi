class SessionsController < ApplicationController

  def new
  end

  def create
    user=User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:user_id]=user.id
      redirect_to cosmetics_path, notice: 'ログインしました'
    else
      render :new
    end
  end


　def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end


  private

  def session_params
    params.permit(:email, :password)
  end


end


