Feature: Basic UI
  In order to aid me in the use of the simulator
  As a user
  I want a basic command line UI

  Scenario: Exit the UI
    Given I have loaded the simulator
    And the UI has displayed the following message: 'Enter EXIT to exit at anytime'
    When I enter EXIT into the command line
    Then the program should exit

  Scenario: Start the Command Loop
    Given I have loaded the simulator
    And the UI has displayed the following message: 'Enter START to start the simulator'
    When I enter START into the command line
    Then the Command Loop should begin
    And the message: 'Enter Command: ' should be displayed
