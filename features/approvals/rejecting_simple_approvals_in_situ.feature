Feature: Rejecting Simple Approvals in situ
	As an approving user
	I want to be able to reject standard approvals with only one approver involved in situ
	So the submitting user can redo them properly

	Scenario: Character Ref rejects a Monster Point Declaration in situ
		Given there is a user
		And the user has a pending monster point declaration
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending monster point declaration in situ
		Then the approval controls should be removed for the monster point declaration from the user's monster points page
		And a monster point declaration rejected message should be displayed on the user's monster points page
		And a monster point declaration rejected email should be sent to the user
		And the monster point declaration should be displayed as rejected on the user's monster point page

	Scenario: Character Ref rejects a Monster Point Adjustment in situ
		Given there is a user
		And the user has a pending monster point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending monster point adjustment in situ
		Then the approval controls should be removed for the monster point adjustment from the user's monster points page
		And a monster point adjustment rejected message should be displayed on the user's monster points page
		And a monster point adjustment rejected email should be sent to the user
		And the monster point adjustment should be displayed as rejected on the user's monster points page

	Scenario: Character Ref rejects a Character Creation request in situ
		Given there is a user
		And the user has a pending character creation request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character creation request in situ
		Then the approval controls should be removed for the character creation from the character's profile page
		And a character creation request rejected message should be displayed on the character's profile page
		And a character creation request rejected email should be sent to the user
		And the character should be displayed as undeclared on the character's profile page

	Scenario: Character Ref rejects a Character Declaration request in situ
		Given there is a user
		And the user has an undeclared character
		And the user has a pending character declaration request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character declaration request in situ
		Then the approval controls should be removed for the character declaration from the character's profile page
		And a character declaration request rejected message should be displayed on the character's profile page
		And a character declaration request rejected email should be sent to the user
		And the character should be displayed as undeclared on the character's profile page

	Scenario: Character Ref rejects a Recycle Character request in situ
		Given there is a user
		And the user has a character
		And the character is at rank 5.0
		And the user has a pending recycle character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending recycle character request in situ
		Then the approval controls should be removed for the character recycling from the character's profile page
		And a recycle character request rejected message should be displayed on the character's profile page
		And a recycle character request rejected email should be sent to the user
		And the character should be displayed as active on the character's profile page
		And the user should have 0 monster points

	Scenario: Character Ref rejects a Resurrect Character request in situ
		Given there is a user
		And the user has a permadead character
		And the user has a pending resurrect character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending resurrect character request in situ
		Then the approval controls should be removed for the character resurrection from the character's profile page
		And a resurrect character request approved message should be displayed on the character's profile page
		And a resurrect character request approved email should be sent to the user
		And the character should be displayed as permdead on the character's profile page

	Scenario: Character Ref rejects a Join Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending join Guild request in situ
		Then the approval controls should be removed for the guild joining from the character's profile page
		And a join Guild request rejected message should be displayed on the character's profile page
		And a join Guild request rejected email should be sent to the user
		And the character should remain guildless on the character's profile page

	Scenario: Character Ref rejects a provisional Join Guild request in situ in situ
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending provisional join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending provisional join Guild request in situ
		Then the approval controls should be removed for the guild joining from the character's profile page
		And a join Guild request rejected message should be displayed on the character's profile page
		And a join Guild request rejected email should be sent to the user
		And the character should become guildless on the character's profile page

	Scenario: Character Ref rejects a Change Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending change Guild request in situ
		Then the approval controls should be removed for the guild change from the character's profile page
		And a change Guild request rejected message should be displayed on the character's profile page
		And a change Guild request rejected email should be sent to the user
		And the character should remain in the first Guild on the character's profile page

	Scenario: Character Ref rejects a Provisional Change Guild request in situ
		Given there is a user
		And the user has a character
		And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has a pending provisional change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending provisional change Guild request in situ
		Then the approval controls should be removed for the guild change from the character's profile page
		And a change Guild request rejected message should be displayed on the character's profile page
		And a change Guild request rejected email should be sent to the user
		And the character should return to the first Guild on the character's profile page

	Scenario: Character Ref rejects a Leave Guild request in situ
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending leave Guild request in situ
		Then the approval controls should be removed for the guild leave from the character's profile page
		And a leave Guild request rejected message should be displayed on the character's profile page
		And a leave Guild request rejected email should be sent to the user
		And the character should remain in the first Guild on the character's profile page

	Scenario: Character Ref rejects a Character Point Adjustment in situ
		Given there is a user
		And the user has a character
		And the user has a pending character point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character point adjustment in situ
		Then the approval controls should be removed for the character point adjustment from the character's profile page
		And a character point adjustment rejected message should be displayed on the character's profile page
		And a character point adjustment rejected email should be sent to the user
		And the character point adjustment should be displayed as rejected on the character's profile page

	Scenario: Character Ref rejects a Character Death Thresholds Adjustment in situ
		Given there is a user
		And the user has a character
		And the user has a pending character death threshold adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character death threshold adjustment in situ
		Then the approval controls should be removed for the death threshold adjustment from the character's profile page
		And a character death threshold adjustment rejected message should be displayed on the character's profile page
		And a character death threshold adjustment rejected email should be sent to the user
		And the character death threshold adjustment should be displayed as rejected on the character's profile page
		And the character should still have 10 death thresholds

	Scenario: Committee rejects a Game Application in situ
		Given there is a user
		And there is another user
		And there is a game
		And the user has a pending game application for the game
		And the other user has a pending game application for the game
		And there is a committee user
		And the committee user is logged in
		When the committee user rejects the pending game application from the first user in situ
		Then the approval controls should be removed for the game application from the game page
		And a game application rejected message should be displayed on the game page
		And a game application rejected email should be sent to the first user
		And no game rejection email should be sent to the second user
		And the game should remain unassigned
