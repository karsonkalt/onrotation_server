# Data
tracks = [
    {name: 'Downriver', artist: 'Roger Martinez', label: 'Lost & Found'},
    {name: 'Epika', artist: 'Guy Mantzur', label: 'Kompakt'},
    {name: 'Small Heart Attack', artist: 'Guy Mantzur', label: 'Lost & Found'},
    {name: 'Matador On A Lose', artist: 'Guy J', label: null},
    {name: 'Ego Tripping', artist: 'Pedro Aguiar', label: 'Lost & Found'},
    {name: `Fool's Don't Last`, artist: 'Guy J', label: 'Bedrock'},
    {name: 'Modular Memories', artist: 'Blusoul', label: 'Lost & Found'},
    {name: 'Vapourspace (Intro Mix)', artist: 'Sasha', label: 'Last Night On Earth'},
    {name: 'Nirvana', artist: 'Guy J', label: 'Bedrock'},
    {name: 'Aeons', artist: 'Ryan Davis', label: 'Unreleased'},
    {name: 'The Nanananinai', artist: 'Holmar', label: 'Get Physical'},
    {name: 'Aurora (AM Mix)', artist: 'Guy J', label: 'Lost & Found'},
    {name: null, artist: '', label: ''},
    {name: '', artist: '', label: ''},
    {name: '', artist: '', label: ''}
]


# Methods
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
    artist_name ? Artist.find_or_create_by(name: artist_name) : null
end

def find_or_create_label(label_name)
    label_name ? Label.find_or_create_by(name: label_name) : null
end


def create_tracks_artists_labels(tracks)
    puts "Generating tracks, artists, and labels\n"
    
    tracks.each do |track|
        Track.create(
            name: track.name,
            artist: find_or_create_artist(track.artist),
            label: find_or_create_label(track.label)
        )

        print "."
    end
end


# Call
create_users(50)
create_tracks_artists_labels(tracks)