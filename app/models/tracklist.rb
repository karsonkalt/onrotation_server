class Tracklist < ApplicationRecord
  belongs_to :artist
  belongs_to :creator, class_name: 'User'
  has_many :bookmarked_tracklists
  has_many :tracklist_tracks
  has_many :tracks, through: :tracklist_tracks

  validates :name, presence: true
  validates :date_played, presence: true
  validates :artist, presence: true

  def tracks
    #TODO Is there a way I can put in the cue time info on this as well?
    #TODO A better way to run through this linked list is to structure with the next track, instead of referencing the previous.
    #TODO This would avoid the .find method and speed up the linkedlist.
   
      tracklist_tracks = self.tracklist_tracks.includes(:track)
      current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == nil}
      
      array_of_tracks = []
      order = 1

      loop do
        current_track = current_tracklist_track.track
        current_track.order = order
        current_track.identifier = current_tracklist_track.identifier
        current_track.suggested_track_identifications = current_tracklist_track.suggested_track_identifications
        current_track.cue_time = current_tracklist_track.cue_time

        order += 1

        array_of_tracks << current_track

        current_tracklist_track = tracklist_tracks.find { |tracklist_track| tracklist_track.predessor_id == current_tracklist_track.id}

        break if current_tracklist_track == nil
      end

      array_of_tracks

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

  # Class Methods

  def self.create_all(name:, date_played:, artist_name:, youtube_url:, creator_id:, tracks:)
    tracklist = Tracklist.create(
      name: name,
      date_played: Date.parse(date_played),
      artist: artist_name ? Artist.find_or_create_by(name: artist_name) : nil,
      youtube_url: youtube_url,
      # Finding random user right now, not current logged in
      creator: User.find_random
    )

    previous_tracklist_track = nil

    tracks.each_with_index do |track, idx|
      if track[:name] != ""
        cur_track = Track.find_or_create_by(
          name: track[:name] != "" ? track[:name] : nil,
          artist: (track[:artistName] != "") ? Artist.find_or_create_by(name: track[:artist]) : nil,
          label: (track[:labelName] != "") ? Label.find_or_create_by(name: track[:labelName]) : nil
        )
      else
        cur_track = Track.create(
          name: track[:name] != "" ? track[:name] : nil,
          artist: (track[:artistName] != "") ? Artist.find_or_create_by(name: track[:artist]) : nil,
          label: (track[:labelName] != "") ? Label.find_or_create_by(name: track[:labelName]) : nil
        )
      end

      time = Time.parse(track[:cueTime])
                  
      previous_tracklist_track = TracklistTrack.create(
          tracklist: tracklist,
          track: cur_track,
          predessor_id: previous_tracklist_track ? previous_tracklist_track.id : nil,
          identifier: User.find_random,
          cue_time: time
      )
    end
    tracklist
  end

end
