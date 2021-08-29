require_relative '02_tracklists'

Users.all.each do |user|
    rand(4).times do
        BookmarkedTrack.create(
            user: user,
            track: Track.find(rand(Track.count) + 1)
        )
    end
end