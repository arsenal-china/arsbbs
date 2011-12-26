class UsersController < ApplicationController
  
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if User.is_invited?(params[:invitation_code])
      if @user.save
        session[:user_id] = @user.id
        redirect_to home_url, :notice => t(:signed_up)
      else
        render :template => "alpha/index"
      end
    else
      flash.now[:alert] = t(:bad_invitation_code)
      render :template => "alpha/index"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to home_url, :notice => t(:profile_updated)
    else
      render :action => 'edit'
    end
  end
end
