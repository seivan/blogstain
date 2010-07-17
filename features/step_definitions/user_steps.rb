Given /^there is an admin with the email "([^"]*)" and the password "([^"]*)"$/ do |arg1, arg2|
  Factory.create(:admin, :email => arg1, :password =>arg2)
end
