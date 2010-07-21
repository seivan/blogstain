Feature: Authentication
  In order to protect content
  As an admin
  I want authentication
  
  Background:
    Given I am on the admin path
  
  Scenario Outline: Signing in with non authorized role
    And there is user <role> with the <credential_type>, the <credential> and the <password>
    And I fill in :"email_or_username" with <credential>
    And I fill in :"password" with <password>
    And I press :"submit"
    Then I should see :"admin_page.fail_create"
    
    Examples:                                   
    | role    | credential_type | credential      | password |
    | "guest" | "username"      | "seivan"        | "secret" |
    | "user"  | "email"         | "seivan@kth.se" | "secret" |

  Scenario: Signing in with false credentials
    When I fill in :"email_or_username" with "IDontexist"
    And I fill in :"password" with "nopeNeitherDoaI"
    Then I should see :"user_session.fail_create"
  
  
  