class SuggestedTrackIdentification < ApplicationRecord
  belongs_to :tracklist_track
  belongs_to :suggested_artist, :class_name => 'Artist'
  belongs_to :identifier, :class_name => 'User'
  has_many :suggested_track_identification_votes
end
