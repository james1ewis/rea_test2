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
