Feature: User signin
  In order to use LeanAnwsers app
  As a existing user
  I want to be able to signin with my account

  Scenario: Sign in with email
    Given there is a user
    When I sign in with email and password of the user
    Then I should be signed in
