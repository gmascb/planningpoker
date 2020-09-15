class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    user.last_login = DateTime.now
    session[:user_id] = user.id
    redirect_to rooms_path(:filtrado => 1)
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end