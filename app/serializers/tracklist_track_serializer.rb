class TracklistTrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :order, :cue_time, :identifier

  belongs_to :artist
  belongs_to :label, serializer: LabelIndexSerializer
  belongs_to :identifier, serializer: UserSerializer

  has_many :suggested_track_identifications, serializer: SuggestedTrackSerializer
end
