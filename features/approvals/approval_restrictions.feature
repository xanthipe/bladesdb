Feature: Approval Restrictions
	As an approving user
	I should not be able to approve my own approval requests
	So shenanigans cannot happen

	Scenario: User cannot approve their own approval for something needing their role on the dashboard
		Given there is a character ref user
		And the user has a pending monster point declaration
		And the user is logged in
		When the user inspects the pending monster point declaration on the dashboard
		Then there should be no monster point declaration for approval on the dashboard

	Scenario: User cannot approve their own monster point declaration in situ
		Given there is a character ref user
		And the user has a pending monster point declaration
		And the user is logged in
		When the user inspects their monster points page
		Then they should not be able to approve the monster point declaration

	Scenario: User cannot approve their own monster point adjustment in situ
		Given there is a character ref user
		And the user has a pending monster point adjustment
		And the user is logged in
		When the user inspects their monster points page
		Then they should not be able to approve the monster point adjustment

	Scenario: User cannot approve their own character creation in situ
		Given there is a character ref user
		And the user has a pending character creation request
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the character creation request in situ

	Scenario: User cannot approve their own character declaration in situ
		Given there is a character ref user
		And the user has a pending character declaration request
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the character declaration request in situ

	Scenario: User cannot approve their own character recycle in situ
		Given there is a character ref user
		And the user has a character
		And the character is at rank 5.0
		And the user has a pending recycle character request
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the recycle character request in situ

	Scenario: User cannot approve their own character resurrection in situ
		Given there is a character ref user
		And the user has a permadead character
		And the user has a pending resurrect character request
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the resurrect character request in situ

	Scenario: User cannot approve their own character join guild in situ
		Given there is a character ref user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the join guild request in situ

	Scenario: User cannot approve their own character change guild in situ
		Given there is a character ref user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the change guild request in situ

	Scenario: User cannot approve their own character leave guild in situ
		Given there is a character ref user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the leave guild request in situ

	Scenario: User cannot approve their own character point adjustment in situ
		Given there is a character ref user
		And the user has a character
		And the user has a pending character point adjustment
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the character point adjustment request in situ

	Scenario: User cannot approve their own character death threshold adjustment in situ
		Given there is a character ref user
		And the user has a character
		And the user has a pending character death threshold adjustment
		And the user is logged in
		When the user inspects the character's profile page
		Then they should not be able to approve the character death threshold adjustment request in situ

	Scenario: User cannot approve their own game application in situ
		Given there is a committee user
		And there is a game
		And the user has a pending game application for the game
		And the user is logged in
		When the user inspects the game page
		Then they should not be able to approve the game application in situ
