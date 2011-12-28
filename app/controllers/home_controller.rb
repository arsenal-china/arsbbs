class HomeController < ApplicationController
  
  before_filter :login_required
  
  def index
    @boards = Board.all
  end

end
