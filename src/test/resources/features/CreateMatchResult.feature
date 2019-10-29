Feature: CreateMatchResult
  In order to use the app
  As a user
  I want to see the result of a Match

  Background:
    Given There is a match
    And There is a team
    And There is a player


  #Scenario: Register new user
  #  Given There is no registered user with username "user"
  #  And I'm not logged in
  #  When I register a new user with username "user", email "user@mytournamentx.game" and password "password"
  #  Then The response code is 201
  #  And It has been created a user with username "user" and email "user@mytournamentx.game", the password is not returned
  #  And I can login with username "user" and password "password"

  Scenario: Assign a match to a MatchResult
    Given   There is no registered matchResult for this Match
    And   I login as "demoP" with password "password"
    When  I register a new MatchResult with Description "description"
    Then  The response code is 201
    And   There is a registered MatchResult with "description" for this match

  Scenario: Register a result with correct parameters (Winner, Description)
    Given There is no registered matchResult for this Match
    And I login as "demoP" with password "password"
    #And I'm logged in like team's leader "" who has played this Match""
    When I register a new MatchResult with Winner "winner" and Description "description"
    Then The response code is 201
    And It has been created a MatchResult with Winner "team" and Description "description"

#  Scenario: Register a result with wrong Winner parameter
#    Given There is no registered result for this Match
#    And I'm logged in like team's leader "" who has played this Match""
#    When I try to register a new result with an invalid Winner
#    Then The response code is 400
#    And The object is not created
#
  Scenario: Replace a result with correct parameters (Winner, Description)
    Given It has been created a MatchResult with Winner "team" and Description "description"
    And I login as "demoP" with password "password"
#    And I'm logged in like team's leader "" who has played this Match""
    When I register a new MatchResult with Winner "winner" and Description "description"
    Then The response code is 201
    And It has been deleted the last MatchResult of a Sender "sender" in that Match
    And It has been created a MatchResult with Winner "team" and Description "description"
#
#  Scenario: Replace a result with wrong Winner parameter
#    Given There is a registered result for this Match
#    And I'm logged in like team's leader "" who has played this Match""
#    When I try to register a new result with an invalid Winner
#    Then The response code is 400
#    And The object is not created
#
#  Scenario: Register a result without being correctly registered
#    Given I'm not logged in
#    When I try to register a new result
#    Then The response code is 400
#    And The object is not created




