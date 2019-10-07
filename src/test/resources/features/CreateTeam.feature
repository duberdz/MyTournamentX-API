Feature: Create Team
  In order to use the app
  As a player
  I want to create a team

  Scenario: Create new team
    Given I login as "demo" with password "password"
    And There is no registered team with name "name"
    When I register a new team with name "team", game "game", level "level", maxPlayers 8
    Then The response code is 201
    And It has been created a team with name "team", game "game", level "level", maxPlayers 8

  Scenario: Create new team with existing name
    Given There is a created team with name "team", game "game", level "level", maxPlayers 8
    And I login as "demo" with password "password"
    When I register a new team with name "team", game "game", level "level", maxPlayers 8
    Then The response code is 409
    And I cannot create a team with name "team"




