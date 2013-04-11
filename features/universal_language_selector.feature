Feature: ULS User language selector

  Scenario: Open Language selector
    Given I visit a random page
    When I click language selector trigger element
    Then I should see the Language selector
