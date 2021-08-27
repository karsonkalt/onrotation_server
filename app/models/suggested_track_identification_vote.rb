class SuggestedTrackIdentificationVote < ApplicationRecord
  belongs_to :identification
  belongs_to :voter
end
