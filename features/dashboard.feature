Feature: Show dashboard
  In order to managecontent
  As a authorized user
  I want to show the dashboard
  
  
  Background:
    Given there is a logged in "admin"
    When I go to the dashboard path
  
  Scenario: Dashboard show page for left menu
    Then I should see :"post.posts"
      And I should see :"user.users"
      And I should see :"comment.comments"
      And I should see :"page.pages"
      And I should see :"tag.tags"
  
  Scenario: Dashboard show page for content
    And I got seed data for application
    Then I should see :"post.latest"
      And I should see :"comments.latest"
      
  
  
  
