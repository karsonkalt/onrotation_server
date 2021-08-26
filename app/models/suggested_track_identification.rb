class SuggestedTrackIdentification < ApplicationRecord
  belongs_to :tracklist_track
  belongs_to :suggested_artist
end
