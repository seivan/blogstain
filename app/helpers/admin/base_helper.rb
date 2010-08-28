module Admin::BaseHelper
    

  
  def show_breadcrumbs
    link_to image_tag("home.png", :alt => "dashboard_show", ), admin_dashboard_path
  end
end
