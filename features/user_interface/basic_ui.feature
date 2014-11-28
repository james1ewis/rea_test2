Feature: Basic UI
  In order to aid me in the use of the simulator
  As a user
  I want a basic command line UI

  Scenario: Display the basic UI
    When I run `robot_simulator` interactively
    And I close the stdin stream
    Then the output should contain "Enter EXIT to exit at anytime"
    And the output should contain "Enter START to start the simulator"

  Scenario: Exit the basic UI
    When I run `robot_simulator` interactively
    And I type "EXIT"
    And I close the stdin stream
    Then the exit status should be 0

  Scenario: Start the command loop
    When I run `robot_simulator` interactively
    And I type "START"
    And I close the stdin stream
    Then the output should contain "Enter Command: "
