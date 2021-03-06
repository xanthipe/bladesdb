Feature: Registration
	As a new user
	I want to be able to register for the website and confirm I'm real
	So I can use all website features

  Scenario: Register account
    Given there is an unregistered user
    When the user attempts to register
    Then the home page should be displayed
    And the user should see a message to check their email
    And the user should receive a confirmation email

  Scenario: Attempt to sign in without confirming e-mail address
    Given there is an unconfirmed user
    When the user logs in
    Then the login page should be displayed
    And the user should see an unconfirmed message

  Scenario: Confirm e-mail address
    Given there is an unconfirmed user
    When the user clicks the first link in the confirmation email
    Then the login page should be displayed
    And the user should see a confirmation message

  Scenario: Sign in as unapproved user
    Given there is an unapproved user
    When the user logs in
    Then the home page should be displayed
    And the user should see an unapproved message

  Scenario: Sign in as approved user
    Given there is a user
    When the user logs in
    Then the home page should be displayed
    And the user should see a successful sign-in message
    
  Scenario: Logged in user cannot visit registration page
    Given there is a user
    And the user is logged in
    When the user goes to the registration page
    Then the home page should be displayed
    And the user should see an already signed in message