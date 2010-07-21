Feature: Admin signing in with either email or username
  In order to modify content
  As an admin
  I want to login with either username or email

Scenario Outline: Signing in as an admin
  Given there is user <role> with the <credential_type>, the <credential> and the <password>
  When I go to the admin path
  And I should see :"user_session.before_create"
  And I fill in :"email_or_username" with <credential>
  And I fill in :"password" with <password>
  And I press :"submit"
  Then I should see :"user_session.after_create"
  
  Examples:                                   
  | role    | credential_type | credential      | password |
  | "admin" | "username"      | "seivan"        | "secret" |
  | "admin" | "email"         | "seivan@kth.se" | "secret" |
