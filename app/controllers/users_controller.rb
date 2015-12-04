class UsersController < ApplicationController

  def show  
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params.require(:user).permit(:username, :password, :password_confirmation))
      flash['notice'] = "Profile updated!"
      redirect_to user_path(@user)
    else
      render :new
    end
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