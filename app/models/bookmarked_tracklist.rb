class BookmarkedTracklist < ApplicationRecord
  belongs_to :user
  belongs_to :tracklist
end
