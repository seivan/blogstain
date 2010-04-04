Given /^a valid guest$/ do
  @user = User.create!({
                 :login => "bertram",
                 :email => "bertram@example.com",
                 :password => "123456",
                 :password_confirmation => "123456",
                 :role => "guest"
               })
end

Given /^a logged in guest$/ do
  Given "a valid guest"
  visit posts_path
end