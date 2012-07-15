Feature: User views the event list page
  As a user
  I want to see a list of events
  So that I may choose to vote/attend an event

  Scenario: User views the list of events
    Given I have 2 events in the system
    When I browse to the event list page
    Then I should see 2 events
