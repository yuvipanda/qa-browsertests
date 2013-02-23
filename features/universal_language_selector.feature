Feature: ULS User language selector

  Scenario: Open Language selector
    Given I am at random translate wiki page
    When I click language selector trigger element
    Then I should see the Language selector
