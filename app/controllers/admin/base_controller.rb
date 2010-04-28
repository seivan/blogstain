class Admin::BaseController < ApplicationController
  before_filter :verify_admin
  layout 'admin'
  
  private
  def verify_admin
    redirect_to root_path unless current_user.role_included_in? User.list_roles_without(["guest", "user"])
    flash[:failure] = t
  end
end
