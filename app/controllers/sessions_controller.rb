class SessionsController < ApplicationController

  def new
  end

  def create
    user=User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])#ユーザーが見つかった場合には、送られてきたパスワードによる認証をauthenticateメソッドを使って行います
      session[:user_id]=user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
    # user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.authenticate(params[:session][:password])
    #   log_in user
    #   redirect_to root_path
    # else
    #   flash.now[:danger] = 'メールアドレスもしくはパスワードが誤っています'
    #   render 'new'
    # end
  end


　def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

end
