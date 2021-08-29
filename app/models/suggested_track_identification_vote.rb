class SuggestedTrackIdentificationVote < ApplicationRecord
  belongs_to :identification
  belongs_to :voter, :class_name => 'User'
end
