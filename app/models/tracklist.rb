class Tracklist < ApplicationRecord
  belongs_to :artist
  belongs_to :creator, class_name: 'User'
  has_many :bookmarked_tracklists
  has_many :tracklist_tracks
  has_many :tracks, through: :tracklist_tracks

  validates :name, presence: true
  validates :date_played, presence: true
  validates :artist, presence: true
  validates :soundcloud_track_id, uniqueness: true

  @tracks = nil

  def tracks
    #TODO Is there a way I can put in the cue time info on this as well?
    #TODO A better way to run through this linked list is to structure with the next track, instead of referencing the previous.
    #TODO This would avoid the .find method and speed up the linkedlist.
    if @tracks === nil
      tracklist_tracks = self.tracklist_tracks.includes(:track)
      current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == nil}
      
      array_of_tracks = []
      order = 1

      loop do
        current_track = current_tracklist_track.track
        current_track.order = order
        current_track.cue_time = current_tracklist_track.cue_time

        order += 1

        array_of_tracks << current_track

        current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == current_tracklist_track.id}

        break if current_tracklist_track == nil
      end

      @tracks = array_of_tracks
    else
      @tracks
    end

  end

  def add_track
    # TODO Add a track
  end

  def delete_track
    # TODO Delete a track
  end

  def number_of_identified_tracks
    self.tracks.count { |track| track.name}
  end

  def number_of_unidentified_tracks
    self.number_of_tracks - number_of_identified_tracks
  end

  def number_of_tracks
    self.tracks.length
  end
end
