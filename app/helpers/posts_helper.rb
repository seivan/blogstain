module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  
    def links_in_tag_cloud(tags)
      tag_cloud(tags, %w(.xxs .xs .s .l .xl .xxl)) do |tag, css_class|
        link_to tag.name, { :action => :tag, :id => tag.name }, :class => css_class
      end
    end
end