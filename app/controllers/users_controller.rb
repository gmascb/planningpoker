class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid)
  end

end