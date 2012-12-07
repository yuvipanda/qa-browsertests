Feature: Search

  Scenario: Search suggestions
    Given I am at random page
    When I search for: main
    Then a list of suggested pages should appear
      And Main Page should be the first result
