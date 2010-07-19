
Given /^there is an admin with the email "([^"]*)" and the password "([^"]*)"$/ do |arg1, arg2|
  Factory.create(:admin, :email => arg1, :password =>arg2, :username => nil)
end

Given /^there is an admin with the username "([^"]*)" and the password "([^"]*)"$/ do |arg1, arg2|
  Factory.create(:admin, :username => arg1, :password => arg2, :email => nil)
end

Given /^there is a logged in user on admin path$/ do
  user = Factory.create(:admin)
  go_to_admin_and_login(user.username, user.password)
end
Then /^I am no longer logged in$/ do
  current_user.should be_nil
end

def go_to_admin_and_login(login,password)
  visit path_to("the admin path")
  fill_in(I18n.t("email_or_username"), :with => login)
  fill_in(I18n.t("password"), :with => password)
  click_button(I18n.t("submit"))
end
