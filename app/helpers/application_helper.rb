module ApplicationHelper
  
  def vote_true(obj)
     obj.votes.where(vote: true, user_id: current_user).any?
  end

  def vote_false(obj)
    obj.votes.where(vote: false, user_id: current_user).any?
  end

end
