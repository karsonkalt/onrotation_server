require_relative '01_users'

def find_or_create_artist(artist_name)
    artist_name ? Artist.find_or_create_by(name: artist_name) : nil
end

def find_or_create_label(label_name)
    label_name ? Label.find_or_create_by(name: label_name) : nil
end

def find_random_user(number_of_users)
    User.find(rand(number_of_users) + 1)
end

def create_tracklists_tracks_artists_labels(tracklists, number_of_users)
    puts "Generating tracklists, tracks, artists, and labels\n"
    
    tracklists.each do |tracklist|
        cur_tracklist = Tracklist.create(
            name: tracklist[:name],
            date_played: Date.parse(tracklist[:date_played]),
            artist: find_or_create_artist(tracklist[:artist]),
            soundcloud_track_id: tracklist[:soundcloud_track_id],
            creator: find_random_user(number_of_users)
        )

        previous_tracklist_track = nil


        tracklist[:tracks].each_with_index do |track, idx|
            cur_track = Track.create(
                name: track[:name],
                artist: find_or_create_artist(track[:artist]),
                label: find_or_create_label(track[:label])
            )
            
            previous_tracklist_track = TracklistTrack.create(
                tracklist: cur_tracklist,
                track: cur_track,
                predessor_id: previous_tracklist_track ? previous_tracklist_track.id : nil,
                identifier: find_random_user(number_of_users)
            )

            print "."
        end
    end
end