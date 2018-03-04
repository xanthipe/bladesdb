@javascript
Feature: Leaving a Guild
	As a player
	I want my characters to be able to join a Guild
	So they can get the shinies

	Background:
		Given there is a user
		And the user has a character
		And there is a Guild
		And the character is a member of the Guild

	Scenario: Leaving a Guild
		Given the user is logged in
		When the character asks to leave the Guild
		Then an application to leave the Guild should be shown on the character's profile
		And an application to leave the Guild message should be displayed

	Scenario: Being ejected from a Guild
		Given there is a Character Ref user
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user ejects the character from the Guild
		Then an ejected from the guild message should be displayed
		And no Guild should be shown on the character's profile
		And an ejected from Guild email should be sent to the user
