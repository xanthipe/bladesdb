Feature: Editing and Withdrawing Approval Requests
	As a user
	I want to be able to edit and withdraw the requests where I can do this
	So that I can correct mistakes before the approvers get to them.

	Background:
	  Given there is a user
	  And the user is logged in

  Scenario: User cannot edit a pending Monster Point Declaration request
    Given the user has a pending monster point declaration
    When the user inspects the pending monster point declaration on the dashboard
    Then there should be no option to edit the pending monster point declaration

  Scenario: User can withdraw a pending Monster Point Declaration request
    Given the user has a pending monster point declaration
    When the user withdraws the pending monster point declaration on the dashboard
    Then the pending monster point declaration should be removed from the dashboard
		And a monster point declaration withdrawn message should be displayed
		And the user's monster points should remain at 0.

  Scenario: User cannot edit a pending Monster Point Adjustment request
    Given the user has a pending monster point adjustment
    When the user inspects the pending monster point adjustment on the dashboard
    Then there should be no option to edit the pending monster point adjustment

  Scenario: User can withdraw a pending Monster Point Adjustment request
    Given the user has a pending monster point adjustment
    When the user withdraws the pending monster point adjustment on the dashboard
    Then the pending monster point adjustment should be removed from the dashboard
		And a monster point adjustment withdrawn message should be displayed
		And the user's monster points should remain at 0.

  Scenario: User cannot edit a pending Character Creation request
    Given the user has a pending character creation request
    When the user inspects the pending character creation request on the dashboard
    Then there should be no option to edit the pending character creation request

  Scenario: User can withdraw a pending Character Creation request even if the character has been signed up to a game
    Given the user has a pending character creation request
		And there is a game
		And the user has applied to play the game with the pending character
    When the user withdraws the pending character creation request on the dashboard
    Then the pending character creation request should be removed from the dashboard
		And a character declaration request withdrawn message should be displayed
		And the character should be removed from the game
		And the character should become an undeclared character

	Scenario: User can withdraw a pending Character Creation request even if the character is on a debriefed game
    Given the user has a pending character creation request
		And there is a game one week ago
		And the user has applied to play the game with the pending character
		And the game has been debriefed
    When the user withdraws the pending character creation request on the dashboard
    Then the pending character creation request should be removed from the dashboard
		And a character creation request withdrawn message should be displayed
		And the character should not be removed from the game debrief
		And the character should become an undeclared character

  Scenario: User cannot edit a pending Character Declaration request
    Given the user has an undeclared character
    And the user has a pending character declaration request for the character
		When the user inspects the pending character declaration request on the dashboard
    Then there should be no option to edit the pending character declaration request

  Scenario: User can withdraw a pending Character Declaration request even if the character is signed up to a game
    Given the user has an undeclared character
		And the user has a pending character declaration request for the character
		And there is a game
		And the user has applied to play the game with the pending character
    When the user withdraws the pending character creation request on the dashboard
    Then the pending character creation request should be removed from the dashboard
		And a character declaration request withdrawn message should be displayed
		And the character should be removed from the game
		And the character should revert to an undeclared character

	Scenario: User can withdraw a pending Character Declaration request even if the character is on a debriefed game
		Given the user has an undeclared character
		And the user has a pending character declaration request for the character
		And there is a game one week ago
		And the user has applied to play the game with the pending character
		And the game has been debriefed
    When the user withdraws the pending character creation request on the dashboard
    Then the pending character creation request should be removed from the dashboard
		And a character declaration request withdrawn message should be displayed
		And the character should not be removed from the game debrief
		And the character should revert to an undeclared character

  Scenario: User cannot edit a pending Recycle Character request
    Given the user has a character
    And the user has a pending character recycle request for the character
    When the user inspects the pending character recycle request on the dashboard
    Then there should be no option to edit the pending character recycle request

  Scenario: User can withdraw a pending Recycle Character request
    Given the user has a character
    And the user has a pending character recycle request for the character
    When the user withdraws the pending character recycle request on the dashboard
    Then the pending character recycle request should be removed from the dashboard
		And a character recycle request withdrawn message should be displayed
		And the character should remain active

  Scenario: User cannot edit a pending Character Resurrection request
    Given the user has a character
    And the character is permadead
    And the user has a pending character resurrection request for the character
		When the user inspects the pending character resurrection request on the dashboard
    Then there should be no option to edit the pending character resurrection request

  Scenario: User can withdraw a pending Character Resurrection request
    Given the user has a character
    And the user has a pending character resurrection request for the character
		When the user withdraws the pending character recycle request on the dashboard
    Then the pending character resurrection request should be removed from the dashboard
		And a character resurrection request withdrawn message should be displayed
		And the character should remain dead

  Scenario: User cannot edit a pending Join Guild request
    Given the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		When the user inspects the pending join Guild request on the dashboard
    Then there should be no option to edit the pending join Guild request

  Scenario: User can withdraw a pending Join Guild request
    Given the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
    When the user withdraws the pending join Guild request on the dashboard
		Then the pending join Guild request should be removed from the dashboard
		And a join Guild request withdrawn message should be displayed
		And the character should remain unguilded.

  Scenario: User cannot edit a pending Change Guild request
    Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And there is another Guild
    And the user has a pending change Guild request for the character
		When the user inspects the pending change Guild request on the dashboard
    Then there should be no option to edit the pending change Guild request

  Scenario: User can withdraw a pending Change Guild request
    Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And there is another Guild
    And the user has a pending change Guild request for the character
    When the user withdraws the pending change Guild request on the dashboard
		Then the pending change Guild request should be removed from the dashboard
		And a change Guild request withdrawn message should be displayed
		And the character should remain in the Guild.

  Scenario: User cannot edit a pending Leave Guild request
    Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		When the user inspects the pending leave Guild request on the dashboard
    Then there should be no option to edit the pending leave Guild request

  Scenario: User can withdraw a pending Leave Guild request
    Given the user has a character
    And there is a Guild
    And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
    When the user withdraws the pending leave Guild request on the dashboard
		Then the pending leave Guild request should be removed from the dashboard
		And a leave Guild request withdrawn message should be displayed
		And the character should remain in the Guild.

  Scenario: User cannot edit a pending Character Point Adjustment request
    Given the user has a character
    And the user has a pending character point adjustment request for the character
		When the user inspects the pending character point adjustment request on the dashboard
		Then there should be no option to edit the pending character point adjustment request

  Scenario: User can withdraw a pending Character Point Adjustment request
    Given the user has a character
    And the user has a pending character point adjustment request for the character
		When the user withdraws the pending character point adjustment on the dashboard
    Then the pending character point adjustment should be removed from the dashboard
		And a character point adjustment withdrawn message should be displayed
		And the character's rank should remain at 2.0.

  Scenario: User cannot edit a pending Death Threshold Adjustment request
    Given the user has a character
    And the user has a pending death threshold adjustment request for the character
		When the user inspects the pending death threshold adjustment request on the dashboard
		Then there should be no option to edit the pending death threshold adjustment request

  Scenario: User can withdraw a pending Death Threshold Adjustment request
    Given the user has a character
    And the user has a pending death threshold adjustment request for the character
		When the user withdraws the pending death threshold adjustment on the dashboard
    Then the pending death threshold adjustment should be removed from the dashboard
		And a death threshold adjustment withdrawn message should be displayed
		And the character's death thresholds should remain at 10

  Scenario: User can edit a pending Game Application request
    Given there is a game
    And the user has a pending game application for the game
    When the user edits the pending game application from the dashboard
    Then a game application updated message should be displayed
		And a game application updated email should be sent to the Committee

  Scenario: User can withdraw a pending Game Application request
    Given there is a game
    And the user has a pending game application for the game
    When the user edits the pending game application on the dashboard
		Then the pending game application should be removed from the dashboard
		And a game application withdrawn message should be displayed
		And a game application withdrawn email should be sent to the Committee
