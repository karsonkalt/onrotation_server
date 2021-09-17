class BookmarkedTrack < ApplicationRecord
  belongs_to :user
  belongs_to :track

  validates :has_unseen_updates, presence: true
end
