module PostsHelper

  def has_comments?
    if @post.comments.size != 0 
      "Comments:"
    else
      "It hasn't been commented yet"
    end
  end

end