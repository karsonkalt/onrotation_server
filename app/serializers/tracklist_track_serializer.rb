class TracklistTrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :order, :cue_time, :suggested_track_identifications

  belongs_to :artist
  belongs_to :label, serializer: LabelIndexSerializer
  belongs_to :identifier, serializer: UserSerializer
  
  def suggested_track_identifications
    ActiveModel::SerializableResource.new(object.suggested_track_identifications,  each_serializer: SuggestedTrackIdentificationSerializer)
  end
end
