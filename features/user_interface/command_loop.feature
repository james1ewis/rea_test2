Feature: UI Command Loop
  In order to control a robot
  As a user
  I want a command loop in which to enter commands

  Scenario: Exciting from the command loop
    Given I run `robot_simulator`
    And I type "START"
    When I type "EXIT"
    Then the exit status should be 0

  Scenario: Entering 2 commands in a loop
    Given I run `robot_simulator`
    And I type "START"
    When I type "REPORT"
    And I type "REPORT"
    Then the output should contain "Enter Command: "
