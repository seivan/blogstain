class Admin::PagesController <  Admin::BaseController
  authorize_resource
  respond_to :html, :json, :js
  def index
    @pages = Page.after_line_order_asc
    if @pages.blank?
      flash[:notice] = t("page.none")
    else
      respond_with @page
    end
  end
  
  def show
    @page = page.find_by_id params[:id]
    respond_with @page
    if @page.blank?
      flash[:notice] = t("page.not_found")
    else
      respond_with @page
    end
  end
  
  def new
    @page = page.new
    flash[:notice] = t("page.before_create")
    respond_with @page
  end
  
  def create
    @page = page.new(params[:page])
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
      @page = page.find_by_id(params[:id])
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
    @page = page.find(params[:id])  
    flash[:notice] = t("page.before_destroy")
    respond_with @page
  end
  
  def destroy
    if @page.destroy
      flash[:success] = t("page.after_destroy")
      redirect_to admin_pages_path      
    else
      flash[:failure] = t("page.fail_destroy")
      redirect_to(@page)
      respond_with @page
  end
  
end

