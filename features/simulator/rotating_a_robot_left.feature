Feature: Rotating a robot left
  In order to control a robot
  As a user
  I want to be able to rotate the robot to the left

  Scenario: Rotating a robot left from north
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,NORTH"
    And I type "LEFT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,WEST"

  Scenario: Rotating a robot left from west
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,WEST"
    And I type "LEFT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,SOUTH"

  Scenario: Rotating a robot left from east
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,EAST"
    And I type "LEFT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,NORTH"

  Scenario: Rotating a robot left from south
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,SOUTH"
    And I type "LEFT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,EAST"
