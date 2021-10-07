require_relative '01_users'

def find_or_create_artist(artist_name)
    artist_name ? Artist.find_or_create_by(name: artist_name) : nil
end

def find_or_create_label(label_name)
    label_name ? Label.find_or_create_by(name: label_name) : nil
end

def find_or_create_track(track_name, artist_name, label_name)
    Track.find_or_create_by(
        name: track_name,
        artist: find_or_create_artist(artist_name),
        label: find_or_create_label(label_name)
    )
end

def create_tracklists_tracks_artists_labels(tracklists, number_of_users)
    puts "Generating Tracklists, Tracks, Artists, and Labels\n"
    
    tracklists.each do |tracklist|
        cur_tracklist = Tracklist.create(
            name: tracklist[:name],
            date_played: Date.parse(tracklist[:date_played]),
            artist: find_or_create_artist(tracklist[:artist]),
            soundcloud_track_id: tracklist[:soundcloud_track_id],
            creator: User.find_random,
        )

        previous_tracklist_track = nil

        #TODO Abstract the track creation method
        tracklist[:tracks].each_with_index do |track, idx|

            if track[:name]
                cur_track = find_or_create_track(track[:name], track[:artist], track[:label])
            else
                cur_track = Track.create(name: track[:name], artist: track[:artist], label: track[:label])
            end
            time = Time.parse(track[:cue_time])
                        
            previous_tracklist_track = TracklistTrack.create(
                tracklist: cur_tracklist,
                track: cur_track,
                predessor_id: previous_tracklist_track ? previous_tracklist_track.id : nil,
                identifier: User.find_random,
                cue_time: time
            )

            puts(previous_tracklist_track.tracklist.name)
            puts(previous_tracklist_track.track.name)
            puts(previous_tracklist_track.predessor_id || "no-predessor")
            puts(previous_tracklist_track.identifier.username)
            puts(previous_tracklist_track.cue_time)
            puts("")


            # print "."
        end
    end

    print "\n"
end