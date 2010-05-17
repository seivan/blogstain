module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper
    def gravatar(email)
      image_tag('http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email), :class => "gravatar")
    end
    
    def readable_time(current_time_shown, msg) 
      if current_time_shown < (7.days.ago)
        "#{msg}: #{current_time_shown.strftime("%Y %m %d")}"
      else
        "#{msg}: #{time_ago_in_words(current_time_shown)} #{t("ago")}"
      end
    end
    

end
