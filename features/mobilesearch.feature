Feature: Mobile Search

  Scenario: Search mobile website for partial string
    Given I am on the Mobile website
    When I type san
    Then Search results should contain San Francisco
