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

  def display_datetime(datetime)
    if logged_in? && !current_user.time_zone.blank?
      datetime = datetime.in_time_zone(current_user.time_zone)
    end
    datetime.strftime "%Y/%m/%d, %H:%M %Z"
  end

end