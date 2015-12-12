class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :editable?, only:[:edit, :update]

  def index
    @posts = Post.all.includes(:comments, :creator, :categories, :votes).order(id: :desc)
  end

  def show
    @comment = Comment.new
    respond_to do |format|
      format.html 
      format.json { render json: @post }
    end

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

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
    @post = Post.find_by(slug: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :description, :category_ids => [])
  end

  def editable?
    unless admin? || current_user == @post.creator 
      access_deny("You are not allowed to do this!")
      redirect_to post_path(@post)
    end
  end

end
