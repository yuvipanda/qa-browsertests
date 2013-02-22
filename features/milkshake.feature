Feature: Milkshake translation

  Scenario: Translate Page
    Given I am not logged in
    When I go to translate page
    Then translate page should open
      And proofread link should exist
