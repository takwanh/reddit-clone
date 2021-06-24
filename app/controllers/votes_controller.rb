class VotesController < ApplicationController

  def create
    vote = current_user.votes.build(vote_params)

    exsiting_vote = Vote.where(user_id: current_user.id, votable_id: params[:votable_id], votable_type: params[:votable_type])
    
    @new_vote = exsiting_vote.size < 1

    respond_to do |format|
      format.js {
        if exsiting_vote.size > 0
          exsiting_vote.first.destroy
        else
          vote.save
        end
        @instance = params[:votable_type].constantize.find(params[:votable_id])
        @is_upvote = params[:upvote]
        render "votes/create"
      }
    end
  end

  private
    def vote_params
      params.permit(:votable_id, :votable_type, :upvote)
    end
end
