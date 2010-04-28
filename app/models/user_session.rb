class UserSession < Authlogic::Session::Base
  generalize_credentials_error_messages(I18n.t("user_session.fail_create"))
end