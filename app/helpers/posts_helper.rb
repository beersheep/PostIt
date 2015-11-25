module PostsHelper

  def has_comments?
    if @post.comments.any?
      "Comments:"
    else
      "It hasn't been commented yet"
    end
  end

end