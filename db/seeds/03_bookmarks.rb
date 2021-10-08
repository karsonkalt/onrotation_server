require_relative '02_tracklists'

def create_bookmarked_tracks
    puts "Generating BookmarkedTracks\n"

    User.all.each do |user|
        rand(3..4).times do

            loop do
                @track = Track.find_random
                break if @track.identified?
            end

            bookmark = BookmarkedTrack.create(
                user: user,
                track: @track,
                has_unseen_updates: true
            )

            print "."
        end
    end

    print "\n"
end

def create_bookmarked_tracklists
    puts "Generating BookmarkedTracklists\n"

    User.all.each do |user|

        rand(3..4).times do
            BookmarkedTracklist.create(
                user: user,
                tracklist: Tracklist.find_random,
                has_unseen_updates: true
            )

            print "."
        end
    end

    print "\n"
end