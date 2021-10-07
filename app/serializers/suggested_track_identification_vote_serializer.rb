class SuggestedTrackIdentificationVoteSerializer < ActiveModel::Serializer
  attributes :is_identification_correct

  belongs_to :voter, serializer: UserSerializer
end
