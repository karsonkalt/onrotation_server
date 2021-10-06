class TracklistIndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_played, :created_at, :soundcloud_track_id, :number_of_identified_tracks, :number_of_tracks

  belongs_to :artist
  belongs_to :creator, serializer: UserSerializer
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