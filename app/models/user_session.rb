class UserSession < Authlogic::Session::Base
  generalize_credentials_error_messages(I18n.t("user_session.fail_create"))
  # def self.oauth_consumer
  #   OAuth::Consumer.new(APP_SETTINGS['consumer_token'], APP_SETTINGS['consumer_secret'],
  #   { :site=>"http://twitter.com",
  #     :authorize_url => "http://twitter.com/oauth/authorize" })
  # end
end