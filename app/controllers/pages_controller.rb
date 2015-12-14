class PagesController < ApplicationController
  def show 

    all_posts = Post.all.includes(:comments, :creator, :categories, :votes)
    @posts = all_posts.offset((params[:id].to_i - 1) * Post::PER_PAGE).limit(Post::PER_PAGE).order(id: :desc)
    total_pages = Post.all.size / Post::PER_PAGE.to_f
    @pages = total_pages.ceil
  end
end