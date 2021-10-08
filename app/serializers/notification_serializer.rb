class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :updated_at, :has_unseen_updates
  belongs_to :track, serializer: TrackSerializer, if: :is_track?
  belongs_to :tracklist, if: :is_tracklist?

  def is_track?
    object.class == BookmarkedTrack
  end

  def is_tracklist?
    object.class == BookmarkedTracklist
  end

end
