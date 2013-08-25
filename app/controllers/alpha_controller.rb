class AlphaController < ApplicationController

  layout "alpha"

  def index
    @user = User.new
  end

end
