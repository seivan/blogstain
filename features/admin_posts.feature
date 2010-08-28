Feature: Admin posts
  In order to handle posts
  As an admin
  I want dashboard for post
  
  Background:
    Given there is a logged in "admin"
      And there are 5 posts
      And there are 25 comments
      And there are 5 "users"
      And there are 10 "guests"
    When I go to the dashboard path
      And I click :"post.posts"

  Scenario: Be on admin posts path
    Then I should be on the admin posts path
  
  Scenario: I should see posts
    Given I have 25 posts
    Then I should see 25 posts with ""

  
  
