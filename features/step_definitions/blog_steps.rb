Given /^I have articles titled "([^\"]*)"$/ do |arg1|
  Post.destroy_all
  arg1.split(",").each do |title|
    s = Post.create(:title => title)
    s.save!
  end
end