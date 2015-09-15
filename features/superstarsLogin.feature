Feature: As a user I want to login to Superstars website

Scenario Outline: Access Superstars with Invalid Credentials
	Given I go to Superstars
	When I click on sign in
	And I sign in with invalid <text_field>
	Then I should see an error message for invalid <text_field>
Examples:
	|text_field		|
	|email				|
	|password			|

@test
Scenario: Access Superstars with Invalid (Unauthorized) User
	Given I go to Superstars
	When I click on sign in
	And I sign in with invalid user
	Then I should be navigated to Superstars home page as unregistered user

@test2
Scenario: Access Superstars with a new User
	Given I go to Superstars
	When I click on sign in
	And I sign in as a new user
	Then I should be navigated to Superstars home page as registered user
	And I should see first access dialog
	And I should see "ac­-superstars-­first-­home-­access" cookie present