class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default home_url, :notice => "Logged in successfully."
    else
      redirect_to alpha_url, :alert => t(:invalid_login)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end

end
