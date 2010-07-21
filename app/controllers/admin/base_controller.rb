class Admin::BaseController < ApplicationController
  before_filter :verify_admin
  skip_before_filter :fetch_published_pages
  layout 'admin'
  
  private
  def verify_admin
      redirect_to posts_path and flash[:failure] = t("admin_page.fail_create") unless current_user.try(:role_included_in?,User.list_roles_without(["guest", "user"]))
  end
  

end
