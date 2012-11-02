Feature: Edit

  Scenario: Go to edit page
    Given I am at a random page
    When I click edit
    Then edit page should open
      And Save button should be there
