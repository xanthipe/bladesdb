Feature: Rejecting Simple Approvals via the Dashboard
	As an approving user
	I want to be able to reject standard approvals with only one approver involved via the dashboard
	So the submitting user can redo them properly

	Scenario: Character Ref rejects a Monster Point Declaration via the dashboard
		Given there is a user
		And the user has a pending monster point declaration
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending monster point declaration via the dashboard
		Then the pending monster point declaration should be removed from the character ref user's dashboard
		And a monster point declaration rejected message should be displayed
		And a monster point declaration rejected email should be sent to the user
		And the monster point declaration should be displayed as rejected on the user's monster point page

	Scenario: Character Ref rejects a Monster Point Adjustment via the dashboard
		Given there is a user
		And the user has a pending monster point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending monster point adjustment via the dashboard
		Then the pending monster point adjustment should be removed from the character ref user's dashboard
		And a monster point adjustment rejected message should be displayed
		And a monster point adjustment rejected email should be sent to the user
		And the monster point adjustment should be displayed as rejected on the user's monster points page

	Scenario: Character Ref rejects a Character Creation request via the dashboard
		Given there is a user
		And the user has a pending character creation request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character creation request via the dashboard
		Then the pending character creation request should be removed from the character ref user's dashboard
		And a character creation request rejected message should be displayed
		And a character creation request rejected email should be sent to the user
		And the character should be displayed as undeclared on the character's profile page

	Scenario: Character Ref rejects a Character Declaration request via the dashboard
		Given there is a user
		And the user has an undeclared character
		And the user has a pending character declaration request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character declaration request via the dashboard
		Then the pending character creation request should be removed from the character ref user's dashboard
		And a character declaration request rejected message should be displayed
		And a character declaration request rejected email should be sent to the user
		And the character should be displayed as undeclared on the character's profile page

	Scenario: Character Ref rejects a Recycle Character request via the dashboard
		Given there is a user
		And the user has a character
		And the character is at rank 5.0
		And the user has a pending recycle character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending recycle character request via the dashboard
		Then the pending recycle character request should be removed from the character ref user's dashboard
		And a recycle character request rejected message should be displayed
		And a recycle character request rejected email should be sent to the user
		And the character should be displayed as active on the character's profile page
		And the user should have 0 monster points

	Scenario: Character Ref rejects a Resurrect Character request via the dashboard
		Given there is a user
		And the user has a permadead character
		And the user has a pending resurrect character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending resurrect character request via the dashboard
		Then the pending resurrect character request should be removed from the character ref user's dashboard
		And a resurrect character request approved message should be displayed
		And a resurrect character request approved email should be sent to the user
		And the character should be displayed as permdead on the character's profile page

	Scenario: Character Ref rejects a Join Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending join Guild request via the dashboard
		Then the pending join Guild request should be removed from the character ref user's dashboard
		And a join Guild request rejected message should be displayed
		And a join Guild request rejected email should be sent to the user
		And the character should remain guildless on the character's profile page

	Scenario: Character Ref rejects a provisional Join Guild request via the dashboard via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending provisional join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending provisional join Guild request via the dashboard
		Then the pending provisional join Guild request should be removed from the character ref user's dashboard
		And a join Guild request rejected message should be displayed
		And a join Guild request rejected email should be sent to the user
		And the character should become guildless on the character's profile page

	Scenario: Character Ref rejects a Change Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending change Guild request via the dashboard
		Then the pending change Guild request should be removed from the character ref user's dashboard
		And a change Guild request rejected message should be displayed
		And a change Guild request rejected email should be sent to the user
		And the character should remain in the first Guild on the character's profile page

	Scenario: Character Ref rejects a Provisional Change Guild request via the dashboard
		Given there is a user
		And the user has a character
		And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has a pending provisional change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending provisional change Guild request via the dashboard
		Then the pending provisional change Guild request should be removed from the character ref user's dashboard
		And a change Guild request rejected message should be displayed
		And a change Guild request rejected email should be sent to the user
		And the character should return to the first Guild on the character's profile page

	Scenario: Character Ref rejects a Leave Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending leave Guild request via the dashboard
		Then the pending leave Guild request should be removed from the character ref user's dashboard
		And a leave Guild request rejected message should be displayed
		And a leave Guild request rejected email should be sent to the user
		And the character should remain in the first Guild on the character's profile page

	Scenario: Character Ref rejects a Character Point Adjustment via the dashboard
		Given there is a user
		And the user has a character
		And the user has a pending character point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character point adjustment via the dashboard
		Then the pending character point adjustment should be removed from the character ref user's dashboard
		And a character point adjustment rejected message should be displayed
		And a character point adjustment rejected email should be sent to the user
		And the character point adjustment should be displayed as rejected on the character's profile page

	Scenario: Character Ref rejects a Character Death Thresholds Adjustment via the dashboard
		Given there is a user
		And the user has a character
		And the user has a pending character death threshold adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user rejects the pending character death threshold adjustment via the dashboard
		Then the pending character death threshold adjustment should be removed from the character ref user's dashboard
		And a character death threshold adjustment rejected message should be displayed
		And a character death threshold adjustment rejected email should be sent to the user
		And the character death threshold adjustment should be displayed as rejected on the character's profile page
		And the character should still have 10 death thresholds

	Scenario: Committee rejects a Game Application via the dashboard
		Given there is a user
		And there is another user
		And there is a game
		And the user has a pending game application for the game
		And the other user has a pending game application for the game
		And there is a committee user
		And the committee user is logged in
		When the committee user rejects the pending game application from the first user via the dashboard
		Then the pending game application should be removed from the committee user's dashboard
		And a game application rejected message should be displayed
		And a game application rejected email should be sent to the first user
		And no game rejection email should be sent to the second user
		And the game should remain unassigned
