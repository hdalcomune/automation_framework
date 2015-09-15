Feature: As a user I want to search for other avenue coders

Scenario: Search for a non existent user
	Given I go to Superstars
	When I click on sign in
	And I sign in as a new user
	Then I should be navigated to Superstars home page as registered user
	When I search for "fasdfsd"
	Then I should not see any valid result

Scenario: Search for an existent user
	Given I go to Superstars
	When I click on sign in
	And I sign in as a new user
	Then I should be navigated to Superstars home page as registered user
	When I search for "user"
	Then I should see at least one result