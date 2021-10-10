class TracklistsController < ApplicationController

    def index
        if params[:artist_id]
            @tracklists = Tracklist.where(artist_id: params[:artist_id])
        elsif params[:track_id]
            @tracklists = Track.find(params[:track_id]).tracklists
        else  
            @tracklists = Tracklist.all
        end
        render json: @tracklists, status: 200, each_serializer: TracklistIndexSerializer
    end

    def show
        @tracklist = Tracklist.find(params[:id])
        render json: @tracklist, status: 200, serializer: TracklistShowSerializer
    end

end
