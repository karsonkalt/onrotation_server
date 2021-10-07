class SuggestedTrackIdentificationSerializer < ActiveModel::Serializer
  attributes :suggested_name, :suggested_track_identification_votes

  belongs_to :identifier, serializer: UserSerializer
  belongs_to :suggested_artist, serializer: ArtistSerializer

  # has_many :suggested_track_identification_votes, each_serializer SuggestedTrackIdentificationVoteSerializer
  def suggested_track_identification_votes
    ActiveModel::SerializableResource.new(object.suggested_track_identification_votes,  each_serializer: SuggestedTrackIdentificationVoteSerializer)
  end
end
