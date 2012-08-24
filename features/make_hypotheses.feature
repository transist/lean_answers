Feature: Make hypotheses
  In order to validate the idea of a project the Lean way
  As a project member
  I want to be able to make hypotheses for the project

  In the Lean way we make three types of hypotheses for a project:

  * Customer Hypothesis
  * Problem Hypothesis
  * Solution Hypothesis

  If all hypotheses are validated, the project is considered validated and
  ready to be implemented. Otherwise we will pivot one of the hypotheses each
  time, validate them again, until all hypotheses are validated.

  Scenario: Make customer hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a customer hypothesis
    Then the customer hypothesis should be created as backlogged

  Scenario: Make problem hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a problem hypothesis
    Then the problem hypothesis should be created as backlogged

  Scenario: Make solution hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a solution hypothesis
    Then the solution hypothesis should be created as backlogged
