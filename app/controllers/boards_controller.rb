class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @topics = @board.topic
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(params[:board])

    if @board.save
      redirect_to @board, :notice => 'Board was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @board = Board.find(params[:id])

    if @board.update_attributes(params[:board])
      redirect_to @board, :notice => 'Board was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url
  end
end
