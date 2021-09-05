require_relative '02_tracklists'

def create_bookmarked_tracks
    puts "Generating BookmarkedTracks\n"

    User.all.each do |user|
        rand(4).times do
            BookmarkedTrack.create(
                user: user,
                track: Track.find_random
            )

            print "."
        end
    end

    print "\n"
end

def create_bookmarked_tracklists
    puts "Generating BookmarkedTracklists\n"

    User.all.each do |user|

        rand(2).times do
            BookmarkedTracklist.create(
                user: user,
                tracklist: Tracklist.find_random
            )

            print "."
        end
    end

    print "\n"
end