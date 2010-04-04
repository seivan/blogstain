Feature: See blog entries
  As one who program
  I want to show my code
  So I can improve my skills with programming

  Background:
    Given a logged in guest
  
  Scenario: View the blog posts  
    When I go to the blog page
    
  
  Scenario: View the blog posts with content on site
    Given I go to the blog page
    And I have articles titled "Ruby on Rails, Django"
    Then I should see "Blog" within "h2"
    And I should see "Ruby on Rails"
    And I should see "Django"
  
  Scenario: View a single blog post
    Given I go to the blog page
    And I have articles titled "Ruby on Rails, Django"
    When I go to article "Ruby on Rails"
    Then I should see "Ruby on Rails" within "h3"
  
  
  
    
  
  
  
  
  
  
  
  
  
  
  