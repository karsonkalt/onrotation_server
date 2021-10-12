class VotesController < ApplicationController

    def index
        @votes = SuggestedTrackIdentificationVote.where(voter_id: params[:user_id])
        render json: @votes, status: 200
    end

    def create
        @vote = SuggestedTrackIdentificationVote.create(
            identification_id: 1,
            voter_id: 1,
            is_identification_correct: true
        )
        render json: @vote, status: 200
    end

end
