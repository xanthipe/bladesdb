Feature: Viewing My Approved Requests
	As a user
	I want to be able to see that my requests have been approved
	So my stuff is up to date

	Background:
		Given there is a user
		And the user is logged in

	Scenario: View an Approved Monster Point Declaration
		Given the user has an approved monster point declaration
		When the user views their approval history
	  Then an approval for a monster point declaration from the Character Refs should be displayed on the dashboard page
		And the monster point declaration should be displayed as approved on the user's monster points page

	Scenario: View an Approved Monster Point Adjustment
		Given the user has an approved monster point adjustment
		When the user views their approval history
	  Then an approval for a monster point adjustment from the Character Refs should be displayed on the dashboard page
		And the monster point adjustment should be displayed as approved on the user's monster points page

	Scenario: View an Approved Character Creation request
		Given the user has an approved character creation
		When the user views their approval history
	  Then an approval to create the character from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as active on the character's profile page

	Scenario: View an Approved Character Declaration request
		Given the user has an approved character declaration
		When the user views their approval history
	  Then an approval to declare the character from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as active on the character's profile page

	Scenario: View an Approved Recycle Character request
	  Given the user has a character that can be recycled
		And the user has an approved recycle character request
		When the user views their approval history
	  Then an approval to recycle the character from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as recycled on the character's profile page
		And the user should have 30 monster points

	Scenario: View an Approved Resurrect Character request
		Given the user has a permadead character
		And the user has an approved resurrect character request
		When the user views their approval history
		Then an approval to resurrect the character from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as active on the character's profile page

	Scenario: View an Approved Join Guild request
	  Given the user has a character
	  And there is a Guild
		And the user has an approved join Guild request
		When the user views their approval history
	  Then an approval to join the Guild from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as having joined the Guild at rank 2.0 on the character's profile page

	Scenario: View a Provisionally Approved Join Guild request
	  Given the user has a character
	  And there is a Guild
		And the user has a provisionally approved join Guild request
		When the user views their dashboard
	  Then a provisionally approved join Guild request from the Character Refs should be displayed on the awaiting approvals section of the dashboard page
		And the character should be displayed as having provisionally joined the Guild at rank 2.0 on the character's profile page

	Scenario: View an Approved Change Guild request
	  Given the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has an approved change Guild request for the character
		When the user views their approval history
	  Then an approval to change Guild from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as having joined the other Guild at rank 2.0 on the character's profile page

	Scenario: View a Provisionally Approved Change Guild request
	  Given the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has a provisionally approved change Guild request for the character
		When the user views their approval history
	  Then a provisionally approved change Guild request from the Character Refs should be displayed on the awaiting approvals section of the dashboard page
		And the character should be displayed as having provisionally joined the other Guild at rank 2.0 on the character's profile page

	Scenario: View an Approved Leave Guild request
	  Given the user has a character
	  And there is a Guild
	  And the character is a member of the Guild
		When the user views their approval history
	  Then an approval to leave the Guild from the Character Refs should be displayed on the dashboard page
		And the character should be displayed as having left the Guild at rank 2.0 on the character's profile page

	Scenario: View an Approved Character Point Adjustment
	  Given the user has a character
		And the user has an approved character point adjustment
		When the user views their approval history
	  Then an approval for a character point adjustment from the Character Refs should be displayed on the dashboard page
		And the character point adjustment should be displayed as approved on the character's profile page

	Scenario: View an Approved Death Threshold Adjustment
	  Given the user has a character
		And the user has an approved character death threshold adjustment
		When the user views their approval history
	  Then an approval for a death threshold adjustment from the Character Refs should be displayed on the dashboard page
		And the character should be left with 9 death thresholds

	Scenario: View an Approved Game Application
		Given there is a game
		And there is a game
		And the user has an approved game application for the game
		When the user views their approval history
		Then an approval for a game application from the Committee should be displayed on the dashboard page
		And the game should be assigned to the user
