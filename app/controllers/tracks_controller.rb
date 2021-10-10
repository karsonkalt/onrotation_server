class TracksController < ApplicationController

    def index
        if params[:artist_id]
            @tracks = Track.where(artist_id: params[:artist_id])
        else
            @tracks = Track.identified_tracks
        end
        render json: @tracks, status: 200
    end

end
