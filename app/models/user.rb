class User < ApplicationRecord
    has_many :bookmarked_tracklists
    has_many :bookmarked_tracks
    has_many :tracklists
    has_many :tracklist_tracks
    has_many :suggested_track_identifications
    has_many :suggested_track_identification_votes

    # TODO Add bcrypt

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {in: 4..15}
    # TODO add URI mailto gem
    validates :email_address, presence: true
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
