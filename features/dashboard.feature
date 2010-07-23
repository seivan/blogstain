Feature: Dashboard
  In order to managecontent
  As a authorized user
  I want a dashboard
  
  
  Background:
    Given there is a logged in "admin"
  
  Scenario: Dashboard show page for left menu
    When I go to the dashboard path
    Then I should see :"post.posts"
      And I should see :"user.users"
      And I should see :"comment.comments"
      And I should see :"page.pages"
  
  
  
