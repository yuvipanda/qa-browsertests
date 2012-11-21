Feature: Mobile Search 

  Scenario: Search mobile website for partial string
    Given I am on the Mobile website
    When I type three known characters
    Then Search results matching my characters appear
