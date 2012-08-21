Feature: User signup
  In order to use LeanAnswers app
  As a new user
  I want to be able to signup to create my account

  Scenario: Sign up with email
    When I sign up with email and password
    Then I should be signed in
