class TracklistShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_played, :created_at, :soundcloud_track_id, :number_of_identified_tracks, :number_of_tracks, :tracks
  
  belongs_to :artist
  belongs_to :creator, serializer: UserSerializer

  def tracks
    ActiveModel::SerializableResource.new(object.tracks,  each_serializer: TracklistTrackSerializer)
  end

end

# Data expected like:
# id: 1,
# name: "Live at UMF Radio",
# datePlayed: "2021-8-25",
# artist: "Guy J",
# creator: "karsonkalt",
# dateCreated: "June 15, 2021",
# numIdentifiedTracks: 12,
# numTotalTracks: 12,
