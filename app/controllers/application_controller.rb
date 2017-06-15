class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :check_user
  
  
  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
  helper_method :current_user
  
  def check_user
    if !current_user
      redirect_to root_path #root_url
    end
  end
end
