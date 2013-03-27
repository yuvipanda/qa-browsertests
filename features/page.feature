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
      And I am on a newly created page with article text
    When I click Move
    Then I should be on a page that says Move newly created page
      And I should see a Namespace selectbox
      And I should see a To new title textbox
      And I should see a Reason textarea
      And I should see a Leave a redirect radio button
      And I should see a Watch source page radio button

  Scenario: Move existing page
    Given I have clicked Move on the newly created page
    When I type To new page name containing the name of the existing page plus text Moved
      And I click Move page
    Then I should be on a page that says Move succeeded
      And I should have a link to the old page title and a link to the new page title
      And I should see the text A redirect has been created

  Scenario: Moved page checks
    Given I moved a page successfully
    When I open the new page URL
      Then the page displays the new title
      And the old page displays a redirect to the new page
