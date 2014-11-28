Feature: UI Command Loop
  In order to control a robot
  As a user
  I want a command loop in which to enter commands

  Scenario: Exciting from the command loop
    When I run `robot_simulator` interactively
    And I type "START"
    And I type ""
    And I type "EXIT"
    And I close the stdin stream
    Then the exit status should be 0

  Scenario: Entering 2 commands in a loop
    When I run `robot_simulator` interactively
    And I type "START"
    And I type ""
    And I type "REPORT"
    And I type ""
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "Enter Command: "
