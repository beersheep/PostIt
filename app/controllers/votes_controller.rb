class VotesController < ApplicationController

  def create

    @vote = Vote.create(vote: params[:vote], voteable_type: params[:type], voteable_id: params[:id])

    if @vote.valid?
      flash['notice'] = "Vote completed!"
      redirect_to root_path
    else
      flash['error'] = "Vote failed! Please try again"
      redirect_to root_path
    end
  end

end