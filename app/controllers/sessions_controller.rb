class SessionsController < ApplicationController
  
  def new; end

  def create
   
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['notice'] = "You are logged in now!"
      redirect_to_previous_or_root
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


  def redirect_to_previous_or_root
    if session[:page_before_redirected] 
      redirect_to session[:page_before_redirected] 
    else 
      redirect_to root_path
    end
  end
end