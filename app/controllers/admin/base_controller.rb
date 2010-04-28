class Admin::BaseController < ApplicationController
  before_filter :verify_admin
  layout 'admin'
  
  private
  def verify_admin
    redirect_to root_path and flash[:failure] = t("admin_page.fail_create") unless current_user.role_included_in? User.list_roles_without(["guest", "user"])
  end
end
