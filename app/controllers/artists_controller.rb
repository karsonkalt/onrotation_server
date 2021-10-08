class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    render json: @artist.tracklists, status: 200, each_serializer: TracklistIndexSerializer
  end
end
