When /^I press :"([^\"]*)"$/ do |key|
  click_button(I18n.t(key)) # or even I18n.t(key, :default => key) if you want to be able to use the key itself as the default
end

Then /^I should see :"([^\"]*)"$/ do |key|
  page.should have_content(I18n.t(key))
end

When /^I click :"([^"]*)"$/ do |key|
  click_link(I18n.t(key))
end
