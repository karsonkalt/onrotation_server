class Tracklist < ApplicationRecord
  belongs_to :artist
  belongs_to :creator
  has_many :bookmarked_tracklists
  has_many :tracklist_tracks
end
