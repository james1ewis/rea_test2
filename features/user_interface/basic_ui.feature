Feature: Basic UI
  In order to aid me in the use of the simulator
  As a user
  I want a basic command line UI

  Scenario: Display the basic UI
    When I run `my-app`
    Then the output should contain "Enter EXIT to exit at anytime"
    And the output should contain "Enter START to start the simulator"

  Scenario: Exit the basic UI
    Given I run `my-app`
    When I type "EXIT"
    Then the exit status should be 0

  Scenario: Start the command loop
    Given I run `my-app`
    When I type "START"
    Then the output should contain "Enter Command: "
