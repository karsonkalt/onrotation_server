class SuggestedTrackIdentification < ApplicationRecord
  belongs_to :tracklist_track
  belongs_to :suggested_artist, :class_name => 'Artist'
  belongs_to :identifier, :class_name => 'User'
  has_many :suggested_track_identification_votes, :foreign_key => 'identification_id'

  #Globals to approve a suggested track identification
  @@percentage_to_be_approved = .75
  @@number_of_votes_to_be_approved = 4

  def vote
  end

end
