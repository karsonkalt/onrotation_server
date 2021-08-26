class TracklistTrack < ApplicationRecord
  belongs_to :tracklist
  belongs_to :track
  belongs_to :identifier
end
