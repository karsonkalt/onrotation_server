class Track < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  has_many :bookmarked_tracks
  has_many :tracklist_tracks

  scope :unknown, -> { where("name IS NULL and artist_id IS NULL") }
  scope :unreleased, -> { where("name IS NOT NULL and artist_id IS NOT NULL and label_id IS NULL") }
  # def unreleased_tracks
  #   Track.where()
  # end
end
