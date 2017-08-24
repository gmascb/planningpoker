class HomesController < ApplicationController

  def show
    if current_user
      #redirect_to root_path
    end
  end
end
