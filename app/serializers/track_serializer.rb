class TrackSerializer < ActiveModel::Serializer
  attributes :id, :artist, :name, :label, :created_at
end
