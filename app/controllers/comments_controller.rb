class CommentsController < ApplicationController
  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit!)
    
    random_user = User.all.shuffle.pop  
    @comment.creator = random_user # TODO: Change this after we have a login system

    if @comment.save 
      flash["notice"] = "Comment created!"
      redirect_to post_path(@post)
    else
      render "posts/show"
    end

  end
end