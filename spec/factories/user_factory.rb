Factory.define(:guest, :class => User) do |u|
  u.sequence(:username){|n| "#{Faker::Name.first_name}#{n}" }
  u.sequence(:email)  {|n| "mail#{n}@gmail.com" }
  u.role  "guest"

  u.password Faker::Name.name
end


Factory.define(:user, :parent => :guest) do |u|
  u.role "user"
end

Factory.define(:writer, :parent => :guest) do |u|
  u.role "writer"
end

Factory.define(:moderator, :parent => :guest) do |u|
  u.role "moderator"
end

Factory.define(:admin, :class => User) do |u|
  u.username  "seivan"
  u.email  "seivan@kth.se"
  u.role  "admin"
  u.password "secret"
end

Factory.define(:invalid_user, :class => User) do |u|
  u.username ""
  u.email ""
  u.role ""
  u.password ""
end