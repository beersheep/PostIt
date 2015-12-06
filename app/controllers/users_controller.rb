class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :user_itself, only: [:edit, :update]


  def show ; end

  def new
    @user = User.new

  end

  def edit ; end

  def update

    if params[:user][:password] != params[:user][:password_confirmation]
      flash['error'] = "Password confirmation does not match"
      render :new
    else

      if @user.update(params.require(:user).permit(:username, :password, :password_confirmation))
        flash['notice'] = "Profile updated!"
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))

    if @user.save
      session[:user_id] = @user.id
      flash['notice'] = "You have successfully registered!"
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def find_user
    @user = User.find_by(slug: params[:id])
  end

  def user_itself
    if @user != current_user
      flash['error'] = "You are not allowed to do this."
      redirect_to root_path
    end
  end
end