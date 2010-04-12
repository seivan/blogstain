User.blueprint do
  password "password"
  password_confirmation "password"
  email Faker::Internet.email
end

User.blueprint(:admin) do
  login "admin"
end

User.blueprint(:user) do
  login "user"
end