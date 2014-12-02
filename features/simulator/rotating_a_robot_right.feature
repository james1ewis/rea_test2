Feature: Rotating a robot right
  In order to control a robot
  As a user
  I want to be able to rotate the robot to the right

  Scenario: Rotating a robot right from north
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,NORTH"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,EAST"

  Scenario: Rotating a robot right from west
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,WEST"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,NORTH"

  Scenario: Rotating a robot right from east
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,EAST"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,SOUTH"

  Scenario: Rotating a robot right from south
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,SOUTH"
    And I type "RIGHT"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,2,WEST"
