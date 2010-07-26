Feature: Authorization
  In order to protect content
  As an admin
  I want authorization
  
  Background:
    Given I am on the login path
  
  Scenario Outline: Signing in with non authorized roles
    And there is user <role> with the <credential_type>, the <credential> and the <password>
    When I fill in :"email_or_username" with <credential>
      And I fill in :"password" with <password>
      And I press :"submit"
    Then I should see :"admin_page.fail_create"
    
    Examples:                                   
    | role    | credential_type | credential      | password |
    | "guest" | "username"      | "seivan"        | "secret" |
    | "user"  | "email"         | "seivan@kth.se" | "secret" |
  
  Scenario Outline: Signing in with authorized roles
    And there is user <role> with the <credential_type>, the <credential> and the <password>
    When I fill in :"email_or_username" with <credential>
      And I fill in :"password" with <password>
      And I press :"submit"
    Then I should see :"user_session.after_create"
    
    Examples:                                   
    | role        | credential_type | credential      | password |
    | "admin"     | "username"      | "seivan"        | "secret" |
    | "writer"    | "email"         | "seivan@kth.se" | "secret" |
    | "moderator" | "email"         | "seivan@kth.se" | "secret" |
  

  Scenario: Signing in with false credentials
    When I fill in :"email_or_username" with "IDontexist"
      And I fill in :"password" with "nopeNeitherDoaI"
      And I press :"submit"
    Then I should see :"user_session.fail_create"
  
  
  
