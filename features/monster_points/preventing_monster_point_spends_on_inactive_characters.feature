@javascript
Feature: Preventing monster point spends
  As the system
  I want to be able to prevent erroneous monster point spends
  So that I can maintain the integrity of the system

  Background:
    Given there is a user
    And the user is logged in

  Scenario: Cannot spend monster points with a pending character declaration
    Given the user has a pending character
    And the user has 10 monster points available
    Then there should be no option for spending monster points
    And the user should be told they cannot spend monster points on an unapproved character

  Scenario: Cannot spend monster points on a retired character
    Given the user has a retired character
    And the user has 10 monster points available
    Then there should be no option for spending monster points
    And the user should be told they cannot spend monster points on a retired character

  Scenario: Cannot spend monster points on a dead character
    Given the user has a permdead character
    And the user has 10 monster points available
    Then there should be no option for spending monster points
    And the user should be told they cannot spend monster points on a dead character

  Scenario: Cannot spend monster points on a recycled character
    Given the user has a recycled character
    And the user has 10 monster points available
    Then there should be no option for spending monster points

  Scenario: Cannot spend monster points on an undeclared character
    Given the user has an undeclared character
    And the user has 10 monster points available
    Then there should be no option for spending monster points
