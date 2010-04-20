class PageController < ApplicationController
    authorize_resource
    respond_to :html, :json, :atom, :js

  def show
    @page = Page.find_by_slug(params[:id])
    #raise ActiveRecord::RecordNotFound, "Page not found" if @page.nil?
    flash[:error] = t("page.not_found") if @page.blank?
    respond_with @page
  end
  
end
