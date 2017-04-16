Feature: Approving Simple Approvals in situ
	As an approving user
	I want to be able to approve standard approvals with only one approver involved in situ
	So the owning user stops bugging me about it

 	# This needs updating to be in situ.

	Scenario: Character Ref approves a Monster Point Declaration in situ
		Given there is a user
		And the user has a pending monster point declaration
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending monster point declaration in situ
		Then the approval controls should be removed for the monster point declaration from the user's monster points page
		And the monster point declaration should be displayed as approved on the user's monster points page
		And a monster point declaration approved message should be displayed
		And a monster point declaration approved email should be sent to the user

	Scenario: Character Ref approves a Monster Point Adjustment in situ
		Given there is a user
		And the user has a pending monster point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending monster point adjustment in situ
		Then the approval controls should be removed for the monster point adjustment from the user's monster points page
		And the monster point adjustment should be displayed as approved on the user's monster points page
		And a monster point adjustment approved message should be displayed
		And a monster point adjustment approved email should be sent to the user

	Scenario: Character Ref approves a Character Creation request in situ
		Given there is a user
		And the user has a pending character creation request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character creation request in situ
		Then the approval controls should be removed for the character creation from the character's profile page
		And the character should be displayed as active on the character's profile page
		And a character creation request approved message should be displayed
		And a character creation request approved email should be sent to the user

	Scenario: Character Ref approves a Character Declaration request in situ
		Given there is a user
		And the user has an undeclared character
		And the user has a pending character declaration request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character declaration request in situ
		Then the approval controls should be removed for the character declaration from the character's profile page
		And the character should be displayed as active on the character's profile page
		And a character declaration request approved message should be displayed
		And a character declaration request approved email should be sent to the user

	Scenario: Character Ref approves a Recycle Character request in situ
		Given there is a user
		And the user has a character
		And the character is at rank 5.0
		And the user has a pending recycle character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending recycle character request in situ
		Then the approval controls should be removed for the character recycling from the character's profile page
		And the character should be displayed as recycled on the character's profile page
		And a recycle character request approved message should be displayed
		And a recycle character request approved email should be sent to the user
		And the user should have 30 monster points

	Scenario: Character Ref approves a Resurrect Character request in situ
		Given there is a user
		And the user has a character
		And the character is dead
		And the user has a pending resurrect character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending resurrect character request in situ
		Then the approval controls should be removed for the character resurrection from the character's profile page
		And the character should be displayed as active on the character's profile page
		And a resurrect character request approved message should be displayed
		And a resurrect character request approved email should be sent to the user

	Scenario: Character Ref approves a Join Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending join Guild request in situ
		Then the approval controls should be removed for the guild joining from the character's profile page
		And the character should be displayed as having joined the Guild at rank 2.0 on the character's profile page
		And a join Guild request approved message should be displayed
		And a join Guild request approved email should be sent to the user

	Scenario: Character Ref provisionally approves a Join Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user provisionally approves the pending join Guild request in situ
		Then the approval controls should not be removed for the guild joining from the character's profile page
		And a join Guild request provisionally approved message should be displayed
		And a join Guild request provisionally approved email should be sent to the user
		And the character should be displayed as having provisionally joined the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Provisional Join Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending provisional join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending provisional join Guild request in situ
		Then the approval controls should be removed for the guild joining from the character's profile page
		And a join Guild request approved message should be displayed
		And a join Guild request approved email should be sent to the user
		And the character should be displayed as having joined the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Change Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending change Guild request in situ
		Then the approval controls should be removed for the guild change from the character's profile page
		And a change Guild request approved message should be displayed
		And a change Guild request approved email should be sent to the user
		And the character should be displayed as having joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref provisionally approves a Change Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user provisionally approves the pending change Guild request in situ
		Then the approval controls should not be removed for the guild change from the character's profile page
		And a change Guild request provisionally approved message should be displayed
		And a change Guild request provisionally approved email should be sent to the user
		And the character should be displayed as having provisionally joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Provisional Change Guild request in situ
		Given there is a user
		And the user has a character
		And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has a pending provisional change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending provisional change Guild request in situ
		Then the approval controls should be removed for the guild change from the character's profile page
		And a change Guild request approved message should be displayed
		And a change Guild request approved email should be sent to the user
		And the character should be displayed as having joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Leave Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending leave Guild request in situ
		Then the approval controls should be removed for the guild leave from the character's profile page
		And a leave Guild request approved message should be displayed
		And a leave Guild request approved email should be sent to the user
		And the character should be displayed as having left the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Character Point Adjustment in situ
		Given there is a user
		And the user has a character
		And the user has a pending character point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character point adjustment in situ
		Then the approval controls should be removed for the character point adjustment from the character's profile page
		And a character point adjustment approved message should be displayed
		And a character point adjustment approved email should be sent to the user
		And the character point adjustment should be displayed as approved on the character's profile page

	Scenario: Character Ref approves a Character Death Thresholds Adjustment in situ
		Given there is a user
		And the user has a character
		And the user has a pending character death threshold adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character death threshold adjustment in situ
		Then the approval controls should be removed for the death threshold adjustment from the character's profile page
		And a character death threshold adjustment approved message should be displayed
		And a character death threshold adjustment approved email should be sent to the user
		And the character death threshold adjustment should be displayed as approved on the character's profile page
		And the character should be left with 9 death thresholds

	Scenario: Committee approves a Game Application for a game with two applicants in situ
		Given there is a user
		And there is another user
		And there is a game
		And the user has a pending game application for the game
		And the other user has a pending game application for the game
		And there is a committee user
		And the committee user is logged in
		When the committee user approves the pending game application from the first user in situ
		Then the approval controls should be removed for the game application from the game page
		And a game application approved message should be displayed
		And a game application approved email should be sent to the first user
		And a game application unsuccessful email should be sent to the second user
		And the game should be assigned to the first user
