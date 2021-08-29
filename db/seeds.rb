# Data

# TODO This needs to be in a different file and imported, it is too complex for here.
tracklists = [
    {
        name: 'Live at UMF Radio',
        date_played: '2021-8-25',
        artist: 'Guy J',
        soundcloud_track_id: 198277293,
        tracks: [
            {name: 'Downriver', artist: 'Roger Martinez', label: 'Lost & Found'},
            {name: 'Epika', artist: 'Guy Mantzur & Roy Rosenfeld', label: 'Kompakt'},
            {name: 'Small Heart Attack (Guy J Remix)', artist: 'Guy Mantzur & Sahar Z', label: 'Lost & Found'},
            {name: 'Matador On A Lose', artist: 'Guy J', label: nil},
            {name: 'Small Heart Attack (Agents of Time Reinterpretation', artist: 'Guy Mantzur & Sahar Z', label: 'Lost & Found'},
            {name: 'Ego Tripping (Guy J Remix)', artist: 'Pedro Aguiar', label: 'Lost & Found'},
            {name: 'Shaiva (Guy J Remix)', artist: 'Chab & DJ Nukem', label: nil},
            {name: "Fool's Don't Last", artist: 'Guy J', label: 'Bedrock'},
            {name: 'Modular Memories', artist: 'Blusoul', label: 'Lost & Found'},
            {name: 'Vapourspace (Intro Mix)', artist: 'Sasha', label: 'Last Night On Earth'},
            {name: 'Nirvana', artist: 'Guy J', label: 'Bedrock'}
        ]
    },

    {
        name: 'Live at Stella Polaris Frederiskberg, Denmark',
        date_played: '2021-8-7',
        artist: 'Guy J',
        soundcloud_track_id: 1106205265,
        tracks: [
            {name: 'Aeons (Tom Day Remix)', artist: 'Ryan Davis', label: nil},
            {name: 'Hole in the Sun (Mr. Herbert Quain 94 Sunrise Version)', artist: 'Ricciardi ft. Notquietsound', label: nil},
            {name: 'Being Me', artist: 'Melchior Sultana & Janelle Pulo', label: 'Being Me'},
            {name: nil, artist: nil, label: nil},
            {name: 'Dry Bridge', artist: 'Clarinets', label: nil},
            {name: 'Kingdom Adesse Versions Remix', artist: 'Maribou State ft. North Downs', label: 'Counter (Ninja)'},
            {name: 'The Nanananinai', artist: 'Holmar', label: 'Get Physical'},
            {name: 'Meet Me On Pluto!', artist: 'Brigade & Acud', label: 'Laut & Luise'},
            {name: 'Rose Rogue (Nightmares On Wax ReRub Edit)', artist: 'St. Germain', label: 'Parlophone'},
            {name: 'Misty Road', artist: 'Andre Lodemann', label: 'Best Works'},
            {name: nil, artist: nil, label: nil},
            {name: 'Aurora (AM Mix)', artist: 'Guy J', label: 'Lost & Found'}
        ]
    }
]


# Methods
# TODO Lots of this can get moved into the models maybe?
def create_users(amount)
    puts "Generating random users from Faker gem\n"
    
    amount.times do
        if rand(2) == 1
            first_name = Faker::Name.first_name
            last_name = Faker::Name.last_name
        end

        if rand(5) == 1
            uid = Faker::Alphanumeric.alphanumeric(number: 10)
        end

        User.create(
            username: Faker::Internet.username,
            first_name: first_name,
            last_name: last_name,
            email_address: Faker::Internet.free_email(name: first_name),
            uid: uid
        )

        print "."
    end
end

def find_or_create_artist(artist_name)
    artist_name ? Artist.find_or_create_by(name: artist_name) : nil
end

def find_or_create_label(label_name)
    label_name ? Label.find_or_create_by(name: label_name) : nil
end

def find_random_user(number_of_users)
    User.find(rand(number_of_users + 1))
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

            byebug

            previous_tracklist_track = TracklistTrack.create(
                tracklist: cur_tracklist,
                track: cur_track,
                predessor_id: previous_tracklist_track,
                identifier_id: find_random_user(number_of_users).id
            )

            print "."
        end
    end
end

# How many users to create
number_of_users = 50

# Call
create_users(number_of_users)
create_tracklists_tracks_artists_labels(tracklists, number_of_users)