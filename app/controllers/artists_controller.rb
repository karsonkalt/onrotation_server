class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
    render json: @artist, status: 200
  end
end
