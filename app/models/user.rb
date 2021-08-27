class User < ApplicationRecord
    has_many :bookmarked_tracklists
    has_many :bookmarked_tracks
    has_many :tracklists
    has_many :tracklist_tracks
    has_many :suggested_track_identifications
    has_many :suggested_track_identification_votes

    # TODO Add bcrypt
end
