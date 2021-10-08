class TracksController < ApplicationController

    def show
        @track = Track.find(params[:id])
        render json: @track.tracklists, status: 200, each_serializer: TracklistIndexSerializer
    end
end
