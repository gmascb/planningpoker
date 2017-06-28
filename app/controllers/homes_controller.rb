class HomesController < ApplicationController
  def show
    if current_user
      redirect_to rooms_path
    end
  end
end
