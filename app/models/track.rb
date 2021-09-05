class Track < ApplicationRecord
  belongs_to :artist, optional: true
  belongs_to :label, optional: true
  has_many :bookmarked_tracks
  has_many :tracklist_tracks
  has_many :tracklists, through: :tracklist_tracks
  has_many :suggested_track_identifications, through: :tracklist_tracks

  attr_accessor :order
  attr_accessor :cue_time

  scope :unknown_name_unknown_artist, -> { where("name IS NULL and artist_id IS NULL") }
  scope :unknown_name_known_artist, -> { where("name IS NULL and artist_id IS NOT NULL") }
  scope :unreleased, -> { where("name IS NOT NULL and artist_id IS NOT NULL and label_id IS NULL") }

  #TODO If ID'ing a track already in the database, then it should delete the record of the null track and update the tracklist_tracks to point to the track.

  def released?
    !!label
  end

end
