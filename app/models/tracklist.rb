class Tracklist < ApplicationRecord
  belongs_to :artist
  belongs_to :creator, class_name: 'User'
  has_many :bookmarked_tracklists
  has_many :tracklist_tracks
  has_many :tracks, through: :tracklist_tracks

  def tracks
    #TODO Is there a way I can put in the cue time info on this as well?
    #TODO A better way to run through this linked list is to structure with the next track, instead of referencing the previous.
    #TODO This would avoid the .find method and speed up the linkedlist.

    tracklist_tracks = self.tracklist_tracks.includes(:track)
    current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == nil}
    
    array_of_tracks = []

    loop do
      array_of_tracks << current_tracklist_track.track
      current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == current_tracklist_track.id}
      break if current_tracklist_track == nil
    end

    array_of_tracks

  end
end
