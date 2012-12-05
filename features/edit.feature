Feature: Edit

  Background:
    Given I am at a random page
    When I click edit

  Scenario: Go to edit page
    Then edit page should open
      And Save button should be there
      And Preview button should be there
      And Show Changes button should be there
      And Edit controls should be there

  Scenario: Read link
    When I click the Read Link
    Then View History link should be there
      And Edit link should be there
      And Preview button should not be there
      And Show Changes button should not be there
      And Save button should not be there
      And Edit controls should not be there

  Scenario: View History link
    When I click the View History Link
    Then Read link should be there
      And Edit link should be there
      And Preview button should not be there
      And Show Changes button should not be there
      And Save button should not be there
      And Edit controls should not be there
