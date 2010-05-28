require 'machinist/active_record'
require 'sham'
require 'faker'

User.blueprint do
  username Faker::Name.first_name
  password "password"
  email Faker::Internet.email
end

User.blueprint(:admin) do
  role "admin"
end

User.blueprint(:user) do
  role "user"
end

User.blueprint(:guest) do
  role "guest"
end