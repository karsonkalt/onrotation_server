class TracklistTrack < ApplicationRecord
  belongs_to :tracklist
  belongs_to :track
  belongs_to :identifier, class: 'User'
  has_many :suggested_track_identifications
  # TODO Do I need to add the predessor has_one relationship?
end
