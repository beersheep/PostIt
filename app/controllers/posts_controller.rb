class PostsController < ApplicationController
  before_action :find_post, only: :show
  def index
    @post = Post.all
  end

  def show
    @post
  end


  private 
  def find_post
    @post = Post.find(params[:id])
  end
end
