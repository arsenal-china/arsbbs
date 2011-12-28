class AlphaController < ApplicationController

  def index
    if logged_in?
      redirect_to home_path
    else
      @user = User.new
    end
  end

end
