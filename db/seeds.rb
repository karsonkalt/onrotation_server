# Generate random Users with Faker gem
puts "Generating random users from Faker gem \n"
50.times do
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