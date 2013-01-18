Feature: Page

  Scenario: Anonymous goes to page that does not exist
    Given I am at page that does not exist
    Then page text should contain There is currently no text in this page.
      And link Create should be there

  Scenario: Anonymous goes to start a new page using the URL
    Given I am at page that does not exist
    When I click link Create
    Then edit page should open
      And text box with page text should be there
      And Save button should be there
      And Preview button should be there
      And Show Changes button should be there
      And Edit controls should be there

  Scenario: Anonymous starts a new page using the URL
    Given I am at page that does not exist
    When I click link Create
      And I enter article text
      And I click Save page button
    Then newly created page should open
      And page title should be there
      And page text should be there
      And Discussion link should be there
      And Edit link should be there
      And View History link should be there
      And watchlist element should not be there
