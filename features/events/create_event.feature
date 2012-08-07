Feature: User creates an event
  As a user
  I want to create an event
  So that I can invite others to vote and attend

  @wip
  Scenario: User creates an event
    When I create an event with the following details:
      | Title       | Snooker party          |
      | Description | Lets play some snooker |
      | Datetime    | 22-2-2012              |
      # TODO: Multiple dates
      # | Datetime    | 22-2-2012              |
    Then I should see an event page with the following details:
      | Title       | Snooker party          |
      | Description | Lets play some snooker |
      | Datetime    | 22-2-2012              |
    And the flash message "Event successfully created"
