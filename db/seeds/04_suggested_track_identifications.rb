require_relative '03_bookmarks'

def create_suggested_track_identifications
    puts "Generating SuggestedTrackIdentifications\n"

    Track.unknown_name_unknown_artist.each do |track|
        # TODO Change to rand() when scaling up
        1.times do

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

    Track.unknown_name_known_artist.each do |track|
        # TODO Change to rand() when scaling up
        1.times do

            SuggestedTrackIdentification.create(
                # TODO Refactor this into User class as private method
                identifier: User.find(rand(User.count) + 1),
                # TODO Can track find its tracklist tracks?
                tracklist_track: track.tracklist_tracks[0],
                suggested_artist: track.artist,
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
                voter: User.find(rand(User.count) + 1),
                is_identification_correct: rand(3) === 0
            )

            print "."
        end
    end

    print "\n"
end