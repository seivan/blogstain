Then /^I should see (\d+) "([^"]*)"$/ do |arg1, arg2|
  0.upto arg1.to_i do |x|
    page.should have_content(x.to_s)
  end
end
