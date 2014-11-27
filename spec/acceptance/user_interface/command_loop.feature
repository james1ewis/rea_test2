Feature: UI Command Loop
  In order to control a robot
  As a user
  I want a command loop in which to enter commands

  Scenario: Accepting commands in a loop
    Given I have started the simulator
    And I have entered START into the command line
    And the output on screen is: 'Enter Command: '
    When I enter something
    Then the output on screen should be: 'Enter Command: '

  Scenario: Exiting the loop
    Given I have started the simulator
    And I have entered START into the command line
    And the output on screen is: 'Enter Command: '
    When I enter EXIT
    Then the system should exit
