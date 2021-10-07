require_relative '00_globals'

def create_users(amount)
    puts "Generating Users with Faker gem\n"
    
    User.create(
        username: "admin",
        first_name: "admin",
        last_name: "admin",
        email_address: "admin@gmail.com",
        password: "password"
    )

    amount.times do

        User.create(
            username: Faker::Internet.username,
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email_address: Faker::Internet.free_email,
            password: "password"
        )

        print "."
    end

    print "\n"
end