Feature: Logging out
  In order to be secure
  As an admin
  I want to be logged out

  Background:
    Given there is a logged in "admin"

  Scenario: Being logged out when going to the admin page
    When I go to the login path
    Then I should see :"user_session.after_destroy"
    And I am no longer logged in
  
  Scenario: Logging out when pressing Log Out
    When I click :"logout"
    Then I should see :"user_session.after_destroy"
    And I am on the posts path