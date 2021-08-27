class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  has_many :bookmarked_tracks
  has_many :tracklist_tracks
end
