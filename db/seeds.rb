require 'faker'

User.delete_all
Event.delete_all

# Create 5,000 users
users = 5.times.map do
  User.create :first_name => Faker::Name.first_name,
              :last_name  => Faker::Name.last_name,
              :email      => Faker::Internet.email,
              :birthdate  => Date.today - 15.years - rand(20000).days,
              :password => "password"
end

User.create(:first_name => "Rich",
            :last_name => "Vogt",
            :email => "rich@me.com",
            :birthdate => "1975/01/14",
            :password => "123456")

1.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create :user_id    => users[rand(users.length)].id,
               :name       => Faker::Company.name,
               :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
               :starts_at => start_time,
               :ends_at   => end_time
end

EventAttendance.create(:user_id => 6,
                       :event_id => 1 )
