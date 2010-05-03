class Admin::PagesController <  Admin::BaseController
  #authorize_resource
  respond_to :html, :json, :js
  def index
    @pages = Page.accessible_by(current_ability, :index).after_line_order_asc
    if @pages.blank?
      flash[:notice] = t("page.none")
    else
      respond_with @pages
    end
  end
  
  def show
    @page = Page.find_by_id params[:id]   
    if @page.blank?
      flash[:notice] = t("page.not_found")
      respond_with @page
    else
      respond_with @page
    end
  end
  
  def new
    @page = Page.new
    flash[:notice] = t("page.before_create")
    respond_with @page
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = t("page.after_create")
      redirect_to edit_admin_page_path(@page)
      respond_with @page
    else
      flash[:failure] = t("page.fail_create")
      render :action => "new"
            respond_with @page
    end
  end
  
  def edit
      @page = Page.find_by_id(params[:id])
      flash[:notice] = t("page.before_update")
      respond_with @page
  end
  
  def update
    if @page.update_attributes(params[:page])
      flash[:success] = t("page.after_update")
      redirect_to edit_admin_page_path(@page)
      respond_with @page
    else
      flash[:failure] = t("page.fail_update")
      render :action => "edit"
      respond_with @page
    end
  end
  
  def delete
    @page = Page.find(params[:id])  
    flash[:notice] = t("page.before_destroy")
    respond_with @page
  end
  
  def destroy
    @page = Page.find_by_id params[:id]   
    if @page.destroy
      flash[:success] = t("page.after_destroy")
      redirect_to admin_pages_path      
    else
      flash[:failure] = t("page.fail_destroy")
      redirect_to(@page)
      respond_with @page
    end
  end
end

