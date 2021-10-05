class TracklistsController < ApplicationController

    def index
        # Use .includes here? N+1 queries
        @tracklists = Tracklist.all
        render json: @tracklists, status: 200
    end

end
