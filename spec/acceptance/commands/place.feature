Feature: Placing a robot
  In order to move a robot around
  As a user
  I want to be able to place the robot on the table

  Scenario: Placing a robot on a valid position
    Given I have entered the REPL
    When I enter PLACE '1,2,NORTH'
    And I enter 'REPORT'
    Then the output should be '1,2,NORTH'

  Scenario: Placing a robot on an invalid position
    Given I have entered the REPL
    When I enter PLACE '0,-1,NORTH'
    And I enter 'REPORT'
    Then there should be no output
