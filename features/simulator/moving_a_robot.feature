Feature: Moving a robot
  In order to control a robot
  As a user
  I want to be able to move a robot around on the table

  Scenario: Moving a robot one unit north
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,NORTH"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,3,NORTH"

  Scenario: Moving a robot one unit south
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,SOUTH"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "1,1,SOUTH"

  Scenario: Moving a robot one unit east
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,EAST"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "2,2,EAST"

  Scenario: Moving a robot one unit west
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 1,2,WEST"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,2,WEST"

  Scenario: Robot should not move off the table
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "PLACE 0,0,WEST"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain "0,0,WEST"

  Scenario: Robot should not move until placed
    When I run `robot_simulator` interactively
    And I type "START"
    And I type "MOVE"
    And I type "REPORT"
    And I close the stdin stream
    Then the output should contain exactly:
      """
      Enter EXIT to exit at anytime
      Enter START to start the simulator
      Enter Command:
      Enter Command:
      """
