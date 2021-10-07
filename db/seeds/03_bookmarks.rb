require_relative '02_tracklists'

def create_bookmarked_tracks
    puts "Generating BookmarkedTracks\n"

    User.all.each do |user|
        rand(4).times do
            bookmark = BookmarkedTrack.create(
                user: user,
                track: Track.find_random,
                has_unseen_updates: rand(2) === 1 ? true : false
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