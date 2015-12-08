class VotesController < ApplicationController
  before_action :find_vote, only: [:change_vote, :destroy, :has_voted?]
  before_action :require_user, only: [:create]

  def create

    if has_voted?
      @vote.vote.to_s == params[:vote] ? self.destroy : self.change_vote
    else
      
      @vote = Vote.create(vote: params[:vote], voteable_type: params[:type], voteable_id: find_id, user: current_user)
      if @vote.valid?
        respond_to do |format|
          format.html {redirect_to :back, notice: "Vote Competed!"}
          format.js 
        end

      else
        flash['error'] = "Vote failed! Please try again"
        redirect_to :back
      end
    end
  end

  def change_vote
    @vote.vote = !@vote.vote

    if @vote.update(vote: params[:vote])
      respond_to do |format|
        format.html {redirect_to :back, success: "You change your mind!"}
        format.js 
      end
    else 
      flash['error'] = "Vote failed! Please try again"
      redirect_to :back
    end
  end

  def destroy 
    if @vote.destroy
      respond_to do |format|
        format.html {redirect_to :back, success: "You cancel the vote!"}
        format.js 
      end
    end

  end

  def has_voted? 
  @vote = Vote.find_by(voteable_type: params[:type], voteable_id: find_id, user: current_user)
  end

  private

  def find_id
    if params[:type] == "Post"
      @post = Post.find_by(slug: params[:slug])
      @post.id
    elsif params[:type] == "Comment"
      params[:id]
    end
  end

  def find_vote
    @vote = Vote.find_by(voteable_type: params[:type], voteable_id: find_id, user: current_user)
  end

end