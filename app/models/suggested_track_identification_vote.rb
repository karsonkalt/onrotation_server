class SuggestedTrackIdentificationVote < ApplicationRecord
  belongs_to :suggested_track_identification
  belongs_to :voter
end
