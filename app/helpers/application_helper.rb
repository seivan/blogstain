module ApplicationHelper
    def gravatar(email)
      image_tag('http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email), :class => "gravatar")
    end
    
    def readable_time(current_time_shown) 
      if current_time_shown >= (Time.zone.now + 7.days)
        current_time_shown.strftime("%Y-%m-%d %H:%M")
      else
        time_ago_in_words(current_time_shown)        
      end
    end

end
