class SessionsController < ApplicationController
  
  def new; end

  def create
   
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash['notice'] = "You are logged in now!"
      redirect_to root_path
    else
      flash['error'] = "Your username or password is wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash['notice'] = "You have logged out!"
    redirect_to root_path
  end

end