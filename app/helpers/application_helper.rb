module ApplicationHelper
    def gravatar(email)
      image_tag('http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email), :class => "gravatar")
    end
    def content_type_path(content, type)
      link_to "#{content.title}", post_path(content) if content.type == "Post"
      link_to "#{content.title}", page_path(content) if content.type == "Page"
    end
end
