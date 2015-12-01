class VotesController < ApplicationController
  before_action :find_vote, only: [:change_vote, :destroy, :has_voted?]

  def create

    if has_voted?

      @vote.vote.to_s == params[:vote] ? self.destroy : self.change_vote
    else
      
      @vote = Vote.create(vote: params[:vote], voteable_type: params[:type], voteable_id: params[:id], user: current_user)
      if @vote.valid?
        flash['notice'] = "Vote completed!" 
        redirect_to_comments_or_index
      else
        flash['error'] = "Vote failed! Please try again"
        redirect_to_comments_or_index
      end
    end
  end

  def change_vote
    @vote.vote = !@vote.vote

    if @vote.update(vote: params[:vote])
      flash[:success] = "change your vote"
      redirect_to_comments_or_index
    else 
      flash['error'] = "Vote failed! Please try again"
      redirect_to_comments_or_index
    end
  end

  def destroy 
    @vote.destroy
    flash[:success] = "vote uncount"
    redirect_to_comments_or_index
  end

  def has_voted? 
  @vote = Vote.find_by(voteable_type: params[:type], voteable_id: params[:id], user: current_user)
  end

  private

  def redirect_to_comments_or_index
    if params[:type] == "Post"
      redirect_to root_path
    else 
      @post = Comment.find(params[:id]).post
      redirect_to post_path(@post)
    end
  end


  def find_vote
    @vote = Vote.find_by(voteable_type: params[:type], voteable_id: params[:id], user: current_user)
  end

end