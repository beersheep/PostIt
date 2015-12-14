class PagesController < ApplicationController
  def show 

    all_posts = Post.all.includes(:comments, :creator, :categories, :votes)
    @posts = all_posts.offset(params[:id].to_i * Post::PER_PAGE).limit(Post::PER_PAGE).order(id: :desc)
  end
end