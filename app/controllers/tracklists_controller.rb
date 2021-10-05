class TracklistsController < ApplicationController

    def index
        @tracklists = Tracklist.all
        render json: @tracklists, status: 200
    end

end
