Feature: Handling My Rejected Requests
	As a user
	I want to be able to view and edit my rejected requests
	So I can fix and resubmit those where it is allowed

	Background:
		Given there is a user
		And the user is logged in

  Scenario: User can edit a rejected Monster Point Declaration request
    Given the user has a rejected monster point declaration
    When the user edits the rejected monster point declaration from the dashboard
    Then the rejected monster point declaration should be displayed as pending on the dashboard
		And a monster point declaration updated message should be displayed

  Scenario: User can withdraw a rejected Monster Point Declaration request
		Given the user has a rejected monster point declaration
    When the user withdraws the rejected monster point declaration from the dashboard
    Then the rejected monster point declaration should be removed from the dashboard
		And a monster point declaration withdrawn message should be displayed
		And the user's monster points should remain at 0

  Scenario: User cannot edit a rejected Monster Point Adjustment request
    Given the user has a rejected monster point adjustment
    When the user inspects the rejected monster point adjustment on the dashboard
    Then there should be no option to edit the rejected monster point adjustment

  Scenario: User cannot withdraw a rejected Monster Point Adjustment request
		Given the user has a rejected monster point adjustment
    When the user inspects the rejected monster point adjustment on the dashboard
    Then there should be no option to withdraw the rejected monster point adjustment

  Scenario: User can edit a rejected Character Creation request
    Given the user has a rejected character creation request
    When the user edits the rejected character creation request from the dashboard
		Then the rejected character creation request should be displayed as pending on the dashboard
		And a character creation updated message should be displayed

  Scenario: User can withdraw a rejected Character Creation request
    Given the user has a rejected character creation request
    When the user withdraws the rejected character creation request from the dashboard
    Then the rejected character creation request should be removed from the dashboard
		And a character creation withdrawn message should be displayed
		And the character should become an undeclared character

  Scenario: User can edit a rejected Character Declaration request
		Given the user has an undeclared character
		And the user has a rejected character declaration request
    When the user edits the rejected character declaration request from the dashboard
		Then the rejected character declaration request should be displayed as pending on the dashboard
		And a character declaration updated message should be displayed

  Scenario: User can withdraw a rejected Character Declaration request
		Given the user has an undeclared character
		And the user has a rejected character declaration request
    When the user withdraws the rejected character declaration request from the dashboard
    Then the rejected character declaration request should be removed from the dashboard
		And a character declaration withdrawn message should be displayed
		And the character should become an undeclared character

  Scenario: User can edit a rejected Recycle Character request
		Given the user has a character
		And the character is at rank 5.0
		And the user has a rejected recycle character request
    When the user inspects the rejected recycle character request on the dashboard
		Then there should be no option to edit the rejected character recycle request

  Scenario: User can withdraw a rejected Recycle Character request
		Given the user has a character
		And the character is at rank 5.0
		And the user has a rejected recycle character request
    When the user withdraws the rejected recycle character request on the dashboard
		Then the rejected character recycle request should be removed from the dashboard
		And a character recycle request withdrawn message should be displayed

  Scenario: User cannot edit a rejected Character Resurrection request
		Given the user has a permadead character
		And the user has a rejected resurrect character request
    When the user inspects the rejected resurrect character request on the dashboard
    Then there should be no option to edit the rejected resurrect character request

  Scenario: User cannot withdraw a rejected Character Resurrection request
		Given the user has a permadead character
		And the user has a rejected resurrect character request
    When the user inspects the rejected resurrect character request on the dashboard
    Then there should be no option to withdraw the rejected resurrect character request

  Scenario: User cannot edit a rejected Join Guild request
		Given the user has a character
		And there is a Guild
		And the user has a rejected join Guild request for the character
    When the user inspects the rejected join Guild request on the dashboard
    Then there should be no option to edit the rejected join Guild request

  Scenario: User cannot withdraw a rejected Join Guild request
		Given the user has a character
		And there is a Guild
		And the user has a rejected join Guild request for the character
    When the user inspects the rejected join Guild request on the dashboard
    Then there should be no option to withdraw the rejected join Guild request

  Scenario: User cannot edit a rejected Change Guild request
		Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And there is another Guild
    And the user has a rejected change Guild request for the character
		When the user inspects the rejected change Guild request on the dashboard
    Then there should be no option to edit the rejected change Guild request

  Scenario: User cannot withdraw a rejected Change Guild request
		Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And there is another Guild
    And the user has a rejected change Guild request for the character
		When the user inspects the rejected change Guild request on the dashboard
    Then there should be no option to withdraw the rejected change Guild request

  Scenario: User cannot edit a rejected Leave Guild request
		Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And the user has a rejected leave Guild request for the character
		When the user inspects the rejected leave Guild request on the dashboard
    Then there should be no option to edit the rejected leave Guild request

  Scenario: User cannot withdraw a rejected Leave Guild request
		Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And the user has a rejected leave Guild request for the character
		When the user inspects the rejected leave Guild request on the dashboard
    Then there should be no option to withdraw the rejected leave Guild request

  Scenario: User cannot edit a rejected Character Point Adjustment request
		Given the user has a character
    And the user has a rejected character point adjustment request for the character
		When the user inspects the rejected character point adjustment request on the dashboard
		Then there should be no option to edit the rejected character point adjustment request

  Scenario: User cannot withdraw a rejected Character Point Adjustment request
		Given the user has a character
    And the user has a rejected character point adjustment request for the character
		When the user inspects the rejected character point adjustment request on the dashboard
		Then there should be no option to withdraw the rejected character point adjustment request

  Scenario: User cannot edit a rejected Death Threshold Adjustment request
		Given the user has a character
    And the user has a rejected death threshold adjustment request for the character
		When the user inspects the rejected death threshold adjustment request on the dashboard
		Then there should be no option to edit the rejected death threshold adjustment request

  Scenario: User cannot withdraw a rejected Death Threshold Adjustment request
		Given the user has a character
    And the user has a rejected death threshold adjustment request for the character
		When the user inspects the rejected death threshold adjustment request on the dashboard
		Then there should be no option to withdraw the rejected death threshold adjustment request

  Scenario: User can edit a rejected Game Application request
		Given there is a game
    And the user has a rejected game application for the game
    When the user edits the rejected game application from the dashboard
    Then the rejected game application should be displayed as pending on the dashboard
		And a game application updated message should be displayed
		And a game application updated email should be sent to the Committee

  Scenario: User can withdraw a rejected Game Application request
		Given there is a game
    And the user has a rejected game application for the game
    When the user withdraws the rejected game application on the dashboard
		Then the rejected game application should be removed from the dashboard
		And a game application withdrawn message should be displayed
