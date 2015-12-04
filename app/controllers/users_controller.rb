class UsersController < ApplicationController

  def show  
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))

    if @user.save
      flash['notice'] = "You have successfully registered!"
      redirect_to root_path
    else
      render :new
    end
  end
end