require_relative '03_bookmarks'

def create_suggested_track_identifications
    puts "Generating SuggestedTrackIdentifications\n"

    Track.unknown_name_unknown_artist.each do |track|
        if rand(5) >= 3

            SuggestedTrackIdentification.create(
                identifier: User.find_random,
                # TODO Can track find its tracklist tracks?
                tracklist_track: track.tracklist_tracks[0],
                # TODO What if suggested Artist is not in the db?
                suggested_artist: Artist.find_random,
                suggested_name: Faker::Music::Phish.song
            )

            print "."
        end
    end

    print "\n"
end

def create_suggested_track_identification_votes
    puts "Generating SuggestedTrackIdentificationVotes\n"

    SuggestedTrackIdentification.all.each do |suggested_track_identification|
        rand(6).times do
            SuggestedTrackIdentificationVote.create(
                identification: suggested_track_identification,
                voter: User.find_random,
                is_identification_correct: rand(3) === 0
            )

            print "."
        end
    end

    print "\n"
end