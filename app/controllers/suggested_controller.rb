class SuggestedController < ApplicationController

    def create
        @suggested = SuggestedTrackIdentification.create(
            identifier: User.find(params[:userId]),
            tracklist_track: TracklistTrack.find(params[:tracklistTrackId] + 1),
            suggested_artist: Artist.find_or_create_by(name: params[:artistName]),
            suggested_name: params[:name],
        )
        render json: @suggested, status: 200
    end
end
