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
    Then it should be created as current customer hypothesis

  Scenario: Make problem hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a problem hypothesis
    Then it should be created as current problem hypothesis

  Scenario: Make solution hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a solution hypothesis
    Then it should be created as current solution hypothesis

  Scenario: Make backlogged customer hypothesis
    Given there is a project
    And I signed in as a member of the project
    When I make a customer hypothesis with "Current" unchecked
    Then it should be created as backlogged customer hypothesis
