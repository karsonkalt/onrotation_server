class Tracklist < ApplicationRecord
  belongs_to :artist
  belongs_to :creator, class_name: 'User'
  has_many :bookmarked_tracklists
  has_many :tracklist_tracks
  has_many :tracks, through: :tracklist_tracks
end
