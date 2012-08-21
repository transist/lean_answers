Feature: Create project
  In order to use LeanAnswers to find out answers to my idea
  As a existing user
  I want to be able to create a new project for the idea

  Scenario: Create project
    Given I am signed in
    When I create a project
    Then the project should be created
