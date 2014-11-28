Feature: Placing a robot
  In order to start controlling a robot
  As a user
  I want to be able to place a robot on the table

  Scenario: Placing a robot within the table bounds
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,NORTH"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,NORTH"

  Scenario: Placing a robot outside the table bounds
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE -1,2,NORTH"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should not contain "-1,2,NORTH"

  Scenario: Replacing a robot within the table bounds
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,NORTH"
    And I type "PLACE 3,2,SOUTH"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "3,2,SOUTH"
