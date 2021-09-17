class BookmarkedTracklist < ApplicationRecord
  belongs_to :user
  belongs_to :tracklist

  validates :has_unseen_updates, presence: true
end
