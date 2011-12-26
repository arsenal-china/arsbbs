class AlphaController < ApplicationController

  def index
    if logged_in?
      redirect_to :home
    end
    @user = User.new
  end

end
