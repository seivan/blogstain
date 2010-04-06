# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
 helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user, :current_user_session

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to signup_path
  end
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    #return @current_user if defined?(@current_user)
    #@current_user = current_user_session && current_user_session.user    
    @current_user ||= login_as_guest
  end

  def login_as_guest
  
    name = session[:session_id]
    @current_user = User.find_by_username(name) || 
                               User.create!(
                               :username => name, 
                               :password => name, 
                               :password_confirmation => name, 
                               :role => "guest", 
                               :email => "change@this.com")
     UserSession.create(@current_user, true)
     @current_user_session = UserSession.find
     #current_user
  end
  
  def current_ability
    Ability.new(current_user)
  end

   
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end