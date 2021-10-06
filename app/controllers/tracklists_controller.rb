class TracklistsController < ApplicationController

    def index
        # Use .includes here? N+1 queries
        @tracklists = Tracklist.all
        render json: @tracklists, status: 200, each_serializer: TracklistIndexSerializer

        # each_serializer parses each individual item in the array
    end

    def show
        @tracklist = Tracklist.find(params[:id])
        render json: @tracklist, status: 200, serializer: TracklistShowSerializer
    end

end
