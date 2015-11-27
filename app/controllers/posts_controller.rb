class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all.includes(:comments, :creator, :categories).order(id: :desc)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.all.shuffle.pop # TODO: Change once we have login system

    if @post.save
      flash['notice'] = "Post created!" 
      redirect_to post_path(@post)
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @post.update(post_params)
      flash['notice'] = "The post has been updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private 

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_ids => [])
  end

end
