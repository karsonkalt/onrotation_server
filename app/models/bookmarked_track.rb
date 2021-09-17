class BookmarkedTrack < ApplicationRecord
  belongs_to :user
  belongs_to :track

  validates :predessor_id, uniqueness: true
end
