Feature: Page does not exist

  Scenario: Go to page that does not exist
    Given I am at page that does not exist
    Then page text should contain There is currently no text in this page.
      And link Create should be there
