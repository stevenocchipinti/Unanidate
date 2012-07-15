Feature: User views an event
  As a user
  I want to see the details of an event
  So that I can vote for an option, select a date, etc.

  @javascript
  Scenario: User views an event
    Given I have 1 event in the system
    When I browse to the event list page
    And I click on the first event in the event list
    And I click on the "Show" link
    Then I should see the event page
