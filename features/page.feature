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

  @login
  Scenario: Move existing page dialog
    Given I am logged in
      And I am starting a page to be moved
      And I create the page to be moved
    When I click Move
    Then I should be on a page that says Move newly created page
      And I should see a Namespace selectbox
      And I should see a To new title textbox
      And I should see a Reason textarea
      And I should see a Leave a redirect radio button
      And I should see a Watch source page radio button

  @ie6-bug @login
  Scenario: Move existing page
    Given I am logged in
    And I am starting a page to be moved to a new name
    And I have clicked Move on the newly created page
    When I make a new page name for the moved page
      And I click Move page
    Then I should be on a page that says Move succeeded
      And I should see the text A redirect has been created
      And I should have a link to the old page title and a link to the new page title
      And the the new page should have the correct text
      And the old page should display a redirect to the new page
