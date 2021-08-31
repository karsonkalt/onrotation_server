class SuggestedTrackIdentificationVote < ApplicationRecord
  belongs_to :identification, :class_name => 'SuggestedTrackIdentification'
  belongs_to :voter, :class_name => 'User'
end
