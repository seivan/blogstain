Feature: Show dashboard
  In order to managecontent
  As a authorized user
  I want to show the dashboard
  
  
  Background:
    Given there is a logged in "admin"
      And there are 5 posts
      And there are 25 comments
      And there are 5 "users"
      And there are 10 "guests"
    When I go to the dashboard path
  
  Scenario: Dashboard show page for left menu
    Then I should see :"post.posts"
      And I should see :"user.users"
      And I should see :"comment.comments"
      And I should see :"page.pages"
  
  Scenario: Dashboard show page for content
    Then I should see :"post.latest"
      And I should see :"user.latest"

  
  Scenario: Dashboard show page for right menu
    Then I should see :"comment.latest"
  
  Scenario: Dashboard show page for footer
    #Then I should see "There are currently 5 posts with 25 comments. Also you have 5 user, while there are 10 guests"
    Then show me the page
  
  
      
      
  
  
