class Artist < ApplicationRecord
    has_many :tracklists
    has_many :tracks
    #TODO Add alias for has_many relationship to all models.
    has_many :suggested_track_identifications, :foreign_key => 'suggested_artist_id'
end
