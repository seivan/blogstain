Given /^there are (\d+) posts$/ do |arg1|
  arg1.to_i.times do 
    Factory.create(:post, :user => User.find_for_database_authentication(:email => "seivan")) 
  end
end

Then /^I should see (\d+) posts$/ do |arg1|
  page.should have_css('li.post', :count => arg1.to_i)
end
