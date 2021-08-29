# Data
artists = ['Unknown Artist', 'Guy J', 'Roger Martinez', 'Guy Mantzur', 'Sahar Z', 'Pedro Aguiar', 'Blusoul', 'Sasha']
labels = ['Unreleased', 'Lost & Found', 'Kompakt', 'Bedrock', 'Last Night on Earth']


# Methods
def create_users(amount)
    puts "Generating random users from Faker gem \n"
    
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

def create_artists(artists)
    artists.each do |artist_name|
        Artist.create(name: artist_name)
    end
end

def create_labels(labels)
    labels.each do |label_name|
        Label.create(name: label_name)
    end
end

# def create_tracks(amount)
#     puts "Generating tracks from Faker gem \n"

#     if rand(5) == 1
#         uid = Faker::Alphanumeric.alphanumeric(number: 10)
#     end
    
#     amount.times do
#         User.create(
#             username: Faker::Internet.username,
#             first_name: first_name,
#             last_name: last_name,
#             email_address: Faker::Internet.free_email(name: first_name),
#             uid: uid
#         )

#         print "."
#     end
# end


# Call
create_users(50)