class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authenticate_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !current_user
      session[:request_path] = request.env['PATH_INFO']
      flash[:danger] = "You must sign in"
      redirect_to sign_in_path
    end
  end
end
