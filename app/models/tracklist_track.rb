class TracklistTrack < ApplicationRecord
  belongs_to :tracklist
  belongs_to :track
  belongs_to :identifier, class_name: 'User'
  has_many :suggested_track_identifications
  # TODO Do I need to add the predessor has_one relationship?

  def cue_time
    hours = (super.strftime("%I").to_i - 5).to_s.rjust(2, '0')
    minutes = super.strftime("%M")
    seconds = super.strftime("%S")
    "#{hours}:#{minutes}:#{seconds}"
  end
  
end
