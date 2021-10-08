class TracklistsController < ApplicationController

    def index
        @tracklists = Tracklist.all
        render json: @tracklists, status: 200, each_serializer: TracklistIndexSerializer
    end

    def show
        @tracklist = Tracklist.find(params[:id])
        render json: @tracklist, status: 200, serializer: TracklistShowSerializer
    end

end
