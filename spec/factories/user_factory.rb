Factory.define(:guest, :class => User) do |u|
  u.login  Faker::Name.first_name
  u.email  Faker::Internet.email
  u.role  "guest"
  u.name  Faker::Name.name
  u.password Faker::Name.name
end


Factory.define(:user) do |u|
  u.login  Faker::Name.first_name
  u.email  Faker::Internet.email
  u.role  "user"
  u.name  Faker::Name.name
  u.password Faker::Name.name
end

Factory.define(:admin, :class => User) do |u|
  u.login  "seivan"
  u.email  "seivan@kth.se"
  u.role  "admin"
  u.name  "Seivan Heidari"
  u.password Faker::Name.name
end


Factory.define(:moderator, :class => User) do |u|
  u.login  Faker::Name.first_name
  u.email  Faker::Internet.email
  u.role  "moderator"
  u.name  Faker::Name.name
  u.password Faker::Name.name
end

Factory.define(:writer, :class => User) do |u|
  u.login  Faker::Name.first_name
  u.email  Faker::Internet.email
  u.role  "writer"
  u.name  Faker::Name.name
  u.password Faker::Name.name
end