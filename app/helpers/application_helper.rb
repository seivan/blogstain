module ApplicationHelper
    def gravatar(email)
      image_tag('http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email), :class => "gravatar")
    end
end
