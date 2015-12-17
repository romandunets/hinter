User.create!(email: "test@mail.com", password: "password", password_confirmation: "password")

99.times do |n|
  email = "test-#{n+1}@mail.com"
  password = "password"
  User.create!(email: email, password: password, password_confirmation: password)
end
