class SuggestedTrackIdentification < ApplicationRecord
  belongs_to :tracklist_track
  belongs_to :suggested_artist
  belongs_to :identifier
  has_many :suggested_track_identification_votes
end
