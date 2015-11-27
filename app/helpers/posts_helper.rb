module PostsHelper

  def has_comments?(post)
    if post.comments.any?
      "Comments:"
    else
      "It hasn't been commented yet"
    end
  end

  def fix_url(url)
    url.start_with?("http://", "https://") ? url : "http://" + url
  end

end