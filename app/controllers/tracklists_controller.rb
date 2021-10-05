class TracklistsController < ApplicationController

    def index
        @tracklists = Tracklist.all
        render json: @tracklists.to_json
    end

end
