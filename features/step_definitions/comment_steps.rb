Given /^there are (\d+) comments$/ do |arg1|
  arg1.to_i.times do |x| Factory.create(:comment) end
end
