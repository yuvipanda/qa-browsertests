Feature: Page

  Scenario: Go to page that does not exist
    Given I am at page that does not exist
    Then page text should contain There is currently no text in this page.
      And link Create should be there

  Scenario: Go to start a new page using the URL
    Given I am at page that does not exist
    When I click link Create
    Then edit page should open
      And text box with page text should be there
      And Save button should be there
      And Preview button should be there
      And Show Changes button should be there
      And Edit controls should be there
