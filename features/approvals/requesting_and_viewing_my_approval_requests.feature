Feature: Requesting and Viewing My Approval Requests
	As a user
	I want to be able to see my outstanding requests that need approval
	So I know when to bug the relevant people in person

Background:
	Given there is a user
	And the user is logged in

Scenario: Request Monster Point Declaration
	When the user submits a monster point declaration request
  Then an approval request for a monster point declaration for the Character Refs should be displayed on the dashboard page

Scenario: Request Monster Point Adjustment
	When the user submits a monster point adjustment request
  Then an approval request for a monster point adjustment for the Character Refs should be displayed on the dashboard page

Scenario: Request Character Creation
	When the user submits a character creation request
  Then an approval request to create the character for the Character Refs should be displayed on the dashboard page

Scenario: Request Character Declaration
	When the user submits a character declaration request
	Then an approval request to declare the character for the Character Refs should be displayed on the dashboard page

Scenario: Request Recycle Character
  Given the user has a character that can be recycled
	When the user submits a character recycle request
  Then an approval request to recycle the character for the Character Refs should be displayed on the dashboard page

Scenario: Request Join Guild
  Given the user has a character
  And there is a Guild
	When the user submits a Guild join request
  Then an approval request to join the Guild for the Character Refs should be displayed on the dashboard page

Scenario: Request Change Guild
  Given the user has a character
  And there is a Guild
  And the character is a member of the Guild
	When the user submits a Guild change request
  Then an approval request to change Guild for the Character Refs should be displayed on the dashboard page

Scenario: Request Leave Guild
  Given the user has a character
  And there is a Guild
  And the character is a member of the Guild
	When the user submits a Guild leave request
  Then an approval request to leave the Guild for the Character Refs should be displayed on the dashboard page

Scenario: Request Character Point Adjustment
  Given the user has a character
	When the user submits a character point adjustment request
  Then an approval request for a character point adjustment for the Character Refs should be displayed on the dashboard page

Scenario: Request Death Threshold Adjustment
  Given the user has a character
	When the user submits a death threshold adjustment request
  Then an approval request for a death threshold adjustment for the Character Refs should be displayed on the dashboard page

Scenario: Request Game Application
	Given there is a game
	When the user applies to run the game
	Then an approval request for a game application for the Committee should be displayed on the dashboard page
