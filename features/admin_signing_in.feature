Feature: Admin signing in
  In order to modify content
  As an admin
  I want admin login

Scenario: Signing in as an admin using email
  Given there is an admin with the email "seivan@kth.se" and the password "secret"
  When I go to the admin path
  And I should see :"user_session.before_create"
  And I fill in :"email_or_username" with "seivan@kth.se"
  And I fill in :"password" with "secret"
  And I press :"submit"
  Then I should see :"user_session.after_create"

Scenario: Signing in as an admin using username
  Given there is an admin with the username "seivan" and the password "secret"
  When I go to the admin path
  And I fill in :"email_or_username" with "seivan"
  And I fill in :"password" with "secret"
  And I press :"submit"
  Then I should see :"user_session.after_create"






  
