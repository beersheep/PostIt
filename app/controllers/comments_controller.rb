class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find_by(slug: params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit!)
  
    @comment.creator = current_user

    if @comment.save 
      flash["notice"] = "Comment created!"
      redirect_to post_path(@post)
    else
      render "posts/show"
    end

  end
end