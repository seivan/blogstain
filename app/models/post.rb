class Post < Content
  scope :published, where(:published => true)
end
