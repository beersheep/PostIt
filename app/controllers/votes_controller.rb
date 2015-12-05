class VotesController < ApplicationController
  before_action :find_vote, only: [:change_vote, :destroy, :has_voted?]

  def create

    if has_voted?

      @vote.vote.to_s == params[:vote] ? self.destroy : self.change_vote
    else
      
      @vote = Vote.create(vote: params[:vote], voteable_type: params[:type], voteable_id: params[:id], user: current_user)
      if @vote.valid?
        flash['notice'] = "Vote completed!" 
        redirect_to :back
      else
        flash['error'] = "Vote failed! Please try again"
        redirect_to :back
      end
    end
  end

  def change_vote
    @vote.vote = !@vote.vote

    if @vote.update(vote: params[:vote])
      flash[:success] = "change your vote"
      redirect_to :back
    else 
      flash['error'] = "Vote failed! Please try again"
      redirect_to :back
    end
  end

  def destroy 
    @vote.destroy
    flash[:success] = "vote uncount"
    redirect_to :back
  end

  def has_voted? 
  @vote = Vote.find_by(voteable_type: params[:type], voteable_id: params[:id], user: current_user)
  end

  private

  def find_vote
    @vote = Vote.find_by(voteable_type: params[:type], voteable_id: params[:id], user: current_user)
  end

end