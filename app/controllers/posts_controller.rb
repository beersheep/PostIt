class PostsController < ApplicationController
  before_action :find_post, only: :show
  def index
    @posts = Post.all.includes(:comments, :creator, :categories)
  end

  def show

  end

  private 
  
  def find_post
    @post = Post.find(params[:id])
  end
end
