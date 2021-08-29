class Track < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  has_many :bookmarked_tracks
  has_many :tracklist_tracks

  scope :unknown_name_and_artist, -> { where("name IS NULL and artist_id IS NULL") }
  scope :unknown_name_known_artist, -> { where("name IS NULL and artist_id IS NOT NULL") }
  scope :unreleased, -> { where("name IS NOT NULL and artist_id IS NOT NULL and label_id IS NULL") }

end
