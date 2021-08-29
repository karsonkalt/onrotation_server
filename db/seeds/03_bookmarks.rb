require_relative '02_tracklists'

def create_bookmarked_tracks
    Users.all.each do |user|
        rand(4).times do
            BookmarkedTrack.create(
                user: user,
                # TODO This should move to the Track model, and find_random_user
                track: Track.find(rand(Track.count) + 1)
            )
        end
    end
end