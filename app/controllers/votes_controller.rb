class VotesController < ApplicationController

    def index
        @votes = SuggestedTrackIdentificationVote.where(voter_id: params[:user_id])
        render json: @votes, status: 200
    end

end
