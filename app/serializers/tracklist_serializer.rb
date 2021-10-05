class TracklistSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_played, :artist, :creator, :date_created,
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