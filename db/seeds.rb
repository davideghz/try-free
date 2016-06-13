User.delete_all
Topic.delete_all
Lesson.delete_all
UserLesson.delete_all

# Users
user = User.new(email: "davideghz@gmail.com",
                password: "12345678")
# user.skip_confirmation! # it sets confirmed_at: DateTime.now
user.save!

user = User.new(email: "marting12@live.dk",
                password: "hejhejhej")
user.save!

10.times do |n|
  email = "example-#{n+1}@example.org"
  password = "12345678"
  user = User.new(email: email,
                  password: password)
  user.save!
end

# Seed the first 2 users with 3 topics each, and one lesson for each topic
users = User.order(:created_at).take(2)
3.times do |n|
  users.each { |user|
    user.topics.create!(title: Faker::Lorem.word.humanize,
                        excerpt: Faker::Hacker.say_something_smart,
                        description: Faker::Hacker.say_something_smart,
                        picture: File.open(File.join(Rails.root,"app/assets/images/image-#{rand(1..6)}.jpg")),
                        category: ["Sport", "Art", "Dance"].sample)

    user.topics.each { |topic| Lesson.create!(topic: topic,
                                         user: user,
                                         lesson_date: Faker::Time.between(DateTime.now, DateTime.now + 90),
                                         country: ["Italy", "Germany", "Denmark"].sample,
                                         city: Faker::Address.city,
                                         address: Faker::Address.street_address,
                                         seats: Faker::Number.between(5, 10))
    }

  }
end
