Feature: Log in

  Scenario: Log in without entering credentials
    Given I am at Log in page
    When I log in without entering credentials
    Then Log in page should open
      And feedback should be You have not specified a valid username.
