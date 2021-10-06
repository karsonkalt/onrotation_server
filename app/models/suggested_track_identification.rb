class SuggestedTrackIdentification < ApplicationRecord
  belongs_to :tracklist_track
  belongs_to :suggested_artist, :class_name => 'Artist'
  belongs_to :identifier, :class_name => 'User'
  has_many :suggested_track_identification_votes, :foreign_key => 'identification_id'

  #Globals to approve a suggested track identification
  @@percentage_to_be_approved = 0.75
  @@number_of_votes_to_be_approved = 4.0
  @@percentage_to_be_rejected = 0.33

  def vote(voter: voter, is_identification_correct: is_identification_correct)
    SuggestedTrackIdentificationVote.create(identification: self, voter: voter, is_identification_correct: is_identification_correct)
    votes = suggested_track_identification_votes
    vote_count = votes.count

    #TODO test next line
    vote_count_correct = votes.select(is_identification_correct: true)
    vote_percentage_correct = vote_count_correct/vote_count
  
    if vote_count >= @@number_of_votes_to_be_approved
      if vote_percentage_correct >= @@percentage_to_be_approved
        #destroy the vote records
        suggested_track_identification_votes.each {|vote| vote.destroy}
        #Turn it into an actual track
      elsif vote_percentage_correct >= @@percentage_to_be_rejected
        #throw away the suggestion
      end
    end

  end

end
