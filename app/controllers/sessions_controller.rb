class SessionsController < ApplicationController

  def create

    # user = User.from_omniauth(env["omniauth.auth"]) > rails 5
    user = User.from_omniauth(request.headers["omniauth.auth"]) # rails 6

    session[:user_id] = user.id
    redirect_to rooms_path(:filtrado => 1)
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end