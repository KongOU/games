class AdminController < ApplicationController
  def index
    if user_signed_in? && current_user.admin == true
      @game = Game.all
    else
      redirect_to root_path
    end
  end

end
