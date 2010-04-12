class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #helper_method :current_user, :current_user_session

  # Scrub sensitive parameters from your log

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_path
  end
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
    debugger
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user    
    @current_user ||= login_as_trial_user
  end

  def login_as_trial_user
    name = session[:session_id]
    @current_user = User.find_by_username(name) || 
                               User.create(
                               :username => name, 
                               :password => name, 
                               :password_confirmation => name, 
                               :role => "guest", 
                               :email => "change@this.com")
     UserSession.create(@current_user, true)
     @current_user_session = UserSession.find
     current_user
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
