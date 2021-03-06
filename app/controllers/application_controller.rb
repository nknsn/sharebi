class ApplicationController < ActionController::Base

   helper_method :current_user


  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
