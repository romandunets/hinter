User.create!(email: "test@mail.com", password: "password", password_confirmation: "password", is_admin: true, activated: true, activated_at: Time.zone.now)

99.times do |n|
  email = "test-#{n+1}@mail.com"
  password = "password"
  User.create!(email: email, password: password, password_confirmation: password, activated: true, activated_at: Time.zone.now)
end
