require_relative '02_tracklists'

def create_bookmarked_tracks
    puts "Generating BookmarkedTracks\n"

    User.all.each do |user|
        rand(4).times do
            BookmarkedTrack.create(
                user: user,
                # TODO This should move to the Track model, and find_random_user
                track: Track.find(rand(Track.count) + 1)
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
                # TODO This should move to the Tracklist model, and find_random_user
                # TODO I could abstract this into ApplicationModel because I am calling it so abstractly so often.
                tracklist: Tracklist.find(rand(Tracklist.count) + 1)
            )

            print "."
        end
    end

    print "\n"
end