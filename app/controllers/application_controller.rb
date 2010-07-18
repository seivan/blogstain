class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #helper_method :current_user, :current_user_session

  # Scrub sensitive parameters from your log
  before_filter :fetch_published_pages
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t("access_denied")
    redirect_to root_path
  end
  
  def current_user_or_trial_user
    return current_user if current_user 
    name = session[:session_id]
    user = User.find_by_username(name)
    sign_in user if user
    return current_user if current_user 
    user ||= User.new(:username => (name),
                      :password => name, 
                      :email => "#{name}@this.com")                             
    user.role = "guest"
    user.save
    sign_in user if user
    return current_user
  end
  
  def current_ability
   @current_ability ||= Ability.new(current_user_or_trial_user)
  end

   
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def fetch_published_pages
    @pages ||= Page.published.line_order_asc
  end
  
end
