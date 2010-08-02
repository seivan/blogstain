Given /^there is user "([^"]*)" with the "([^"]*)", the "([^"]*)" and the "([^"]*)"$/ do |arg1, arg2, arg3, arg4|
  u = User.new(arg2.to_sym => arg3, :password => arg4)
  u.role = arg1
  u.save!
end

Given /^there is a logged in "([^"]*)"$/ do |arg1|
  user = Factory.create(arg1.to_sym)
  go_to_login_path_and_login(user.username, user.password)
end


Then /^I am no longer logged in$/ do
  page.should have_content(I18n.t("user_session.after_destroy"))
end

def go_to_login_path_and_login(login,password)
  visit path_to("the login path")
  fill_in(I18n.t("email_or_username"), :with => login)
  fill_in(I18n.t("password"), :with => password)
  click_button(I18n.t("submit"))
end

Given /^there are (\d+) "([^"]*)"$/ do |arg1, arg2|
  arg1.to_i.times do Factory.create(arg2.singularize.to_sym) end
end

Then /^I should see (\d+) users$/ do |arg1|
  page.should have_css('li.user', :count => arg1.to_i)
end
