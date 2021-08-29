require_relative '03_bookmarks'

def create_suggested_track_identifications
    puts "Generating SuggestedTrackIdentifications\n"

    Track.unknown_name_unknown_artist.each do |track|
        rand(2).times do

            byebug
            
            SuggestedTrackIdentification.create(
                # TODO Refactor this into User class as private method
                identifier: User.find(rand(User.count) + 1),
                # TODO Can track find its tracklist tracks?
                tracklist_track: track.tracklist_tracks[0],
                suggested_artist: Artist.find(rand(Artist.count) + 1),
                suggested_name: Faker::Music::Phish.song
            )

            print "."
        end
    end

    print "\n"
end