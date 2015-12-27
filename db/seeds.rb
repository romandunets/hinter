User.create!(email: "test@mail.com", password: "password", password_confirmation: "password", is_admin: true, activated: true, activated_at: Time.zone.now)

99.times do |n|
  email = "test-#{n+1}@mail.com"
  password = "password"
  User.create!(email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(1)
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.tasks.create!(title: title, description: description, priority: 2, state: "Open", deadline: DateTime.now + 7.days, user_id: user.id) }
end
