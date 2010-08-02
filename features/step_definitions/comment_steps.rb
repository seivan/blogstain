Given /^there are (\d+) comments$/ do |arg1|
  arg1.to_i.times do |x| Factory.create(:comment) end
end

Then /^I should see (\d+) comments$/ do |arg1|
  page.should have_css('li.comment', :count => arg1.to_i)
end
