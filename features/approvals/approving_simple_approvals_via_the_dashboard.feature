Feature: Approving Simple Approvals via the Dashboard
	As an approving user
	I want to be able to approve standard approvals with only one approver involved via the dashboard
	So the owning user stops bugging me about it

	Scenario: Character Ref approves a Monster Point Declaration via the dashboard
		Given there is a user
		And the user has a pending monster point declaration
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending monster point declaration via the dashboard
		Then the pending monster point declaration should be removed from the character ref user's dashboard
		And a monster point declaration approved message should be displayed on the dashboard
		And a monster point declaration approved email should be sent to the user
		And the monster point declaration should be displayed as approved on the user's monster points page

	Scenario: Character Ref approves a Monster Point Adjustment via the dashboard
		Given there is a user
		And the user has a pending monster point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending monster point adjustment via the dashboard
		Then the pending monster point adjustment should be removed from the character ref user's dashboard
		And a monster point adjustment approved message should be displayed on the dashboard
		And a monster point adjustment approved email should be sent to the user
		And the monster point adjustment should be displayed as approved on the user's monster points page

	Scenario: Character Ref approves a Character Creation request via the dashboard
		Given there is a user
		And the user has a pending character creation request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character creation request via the dashboard
		Then the pending character creation request should be removed from the character ref user's dashboard
		And a character creation request approved message should be displayed on the dashboard
		And a character creation request approved email should be sent to the user
		And the character should be displayed as active on the character's profile page

	Scenario: Character Ref approves a Character Declaration request via the dashboard
		Given there is a user
		And the user has an undeclared character
		And the user has a pending character declaration request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character declaration request via the dashboard
		Then the pending character declaration request should be removed from the character ref user's dashboard
		And a character declaration request approved message should be displayed on the dashboard
		And a character declaration request approved email should be sent to the user
		And the character should be displayed as active on the character's profile page

	Scenario: Character Ref approves a Recycle Character request via the dashboard
		Given there is a user
		And the user has a character
		And the character is at rank 5.0
		And the user has a pending recycle character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending recycle character request via the dashboard
		Then the pending recycle character request should be removed from the character ref user's dashboard
		And a recycle character request approved message should be displayed on the dashboard
		And a recycle character request approved email should be sent to the user
		And the character should be displayed as recycled on the character's profile page
		And the user should have 30 monster points

	Scenario: Character Ref approves a Resurrect Character request via the dashboard
		Given there is a user
		And the user has a permadead character
		And the user has a pending resurrect character request
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending resurrect character request via the dashboard
		Then the pending resurrect character request should be removed from the character ref user's dashboard
		And a resurrect character request approved message should be displayed on the dashboard
		And a resurrect character request approved email should be sent to the user
		And the character should be displayed as active on the character's profile page

	Scenario: Character Ref approves a Join Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending join Guild request via the dashboard
		Then the pending join Guild request should be removed from the character ref user's dashboard
		And a join Guild request approved message should be displayed on the dashboard
		And a join Guild request approved email should be sent to the user
		And the character should be displayed as having joined the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref provisionally approves a Join Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user provisionally approves the pending join Guild request via the dashboard
		Then the pending join Guild request should remain on the character ref user's dashboard as a provisional acceptance
		And a join Guild request provisionally approved message should be displayed on the dashboard
		And a join Guild request provisionally approved email should be sent to the user
		And the character should be displayed as having provisionally joined the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Provisional Join Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
    And the user has a pending provisional join Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending provisional join Guild request via the dashboard
		Then the pending provisional join Guild request should be removed from the character ref user's dashboard
		And a join Guild request fully approved message should be displayed on the dashboard
		And a join Guild request fully approved email should be sent to the user
		And the character should be displayed as having joined the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Change Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending change Guild request via the dashboard
		Then the pending change Guild request should be removed from the character ref user's dashboard
		And a change Guild request approved message should be displayed on the dashboard
		And a change Guild request approved email should be sent to the user
		And the character should be displayed as having joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref provisionally approves a Change Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
    And the user has a pending change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user provisionally approves the pending change Guild request via the dashboard
		Then the pending change Guild request should remain on the character ref user's dashboard as a provisional acceptance
		And a change Guild request provisionally approved message should be displayed on the dashboard
		And a change Guild request provisionally approved email should be sent to the user
		And the character should be displayed as having provisionally joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Provisional Change Guild request via the dashboard
		Given there is a user
		And the user has a character
		And there is a Guild
		And the character is a member of the Guild
		And there is another Guild
		And the user has a pending provisional change Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending provisional change Guild request via the dashboard
		Then the pending provisional change Guild request should be removed from the character ref user's dashboard
		And a change Guild request fully approved message should be displayed on the dashboard
		And a change Guild request fully approved email should be sent to the user
		And the character should be displayed as having joined the other Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Leave Guild request via the dashboard
		Given there is a user
		And the user has a character
    And there is a Guild
		And the character is a member of the Guild
    And the user has a pending leave Guild request for the character
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending leave Guild request via the dashboard
		Then the pending leave Guild request should be removed from the character ref user's dashboard
		And a leave Guild request approved message should be displayed on the dashboard
		And a leave Guild request approved email should be sent to the user
		And the character should be displayed as having left the Guild at rank 2.0 on the character's profile page

	Scenario: Character Ref approves a Character Point Adjustment via the dashboard
		Given there is a user
		And the user has a character
		And the user has a pending character point adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character point adjustment via the dashboard
		Then the pending character point adjustment should be removed from the character ref user's dashboard
		And a character point adjustment approved message should be displayed on the dashboard
		And a character point adjustment approved email should be sent to the user
		And the character point adjustment should be displayed as approved on the character's profile page

	Scenario: Character Ref approves a Character Death Thresholds Adjustment via the dashboard
		Given there is a user
		And the user has a character
		And the user has a pending character death threshold adjustment
		And there is a character ref user
		And the character ref user is logged in
		When the character ref user approves the pending character death threshold adjustment via the dashboard
		Then the pending character death threshold adjustment should be removed from the character ref user's dashboard
		And a character death threshold adjustment approved message should be displayed on the dashboard
		And a character death threshold adjustment approved email should be sent to the user
		And the character death threshold adjustment should be displayed as approved on the character's profile page
		And the character should be left with 9 death thresholds

	Scenario: Committee approves a Game Application for a game with two applicants via the dashboard
		Given there is a user
		And there is another user
		And there is a game
		And the user has a pending game application for the game
		And the other user has a pending game application for the game
		And there is a committee user
		And the committee user is logged in
		When the committee user approves the pending game application from the first user via the dashboard
		Then the pending game application should be removed from the committee user's dashboard
		And a game application approved message should be displayed on the dashboard
		And a game application approved email should be sent to the first user
		And a game application unsuccessful email should be sent to the second user
		And the game should be assigned to the first user
