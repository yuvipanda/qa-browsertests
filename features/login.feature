Feature: Log in

  Background:
    Given I am at Log in page

  Scenario: Go to Log in page
    Then Log in page should open
      And Username element should be there
      And Password element should be there
      And Log in element should be there

  Scenario: Log in without entering credentials
    When I log in without entering credentials
    Then Log in page should open
      And feedback should be You have not specified a valid username.

  Scenario: Log in without entering password
    When I log in without entering password
    Then Log in page should open
      And feedback should be Password entered was blank. Please try again.

  Scenario: Log in with incorrect username
    When I log in with incorrect username
    Then Log in page should open
    And feedback should be There is no user by the name "incorrect username". Usernames are case sensitive. Check your spelling, or create a new account.

  Scenario: Log in with incorrect password
    When I log in with incorrect password
    Then Log in page should open
      And feedback should be Incorrect password entered. Please try again.

  @login
  Scenario: Log in with valid credentials
    When Log in as Selenium_user
    Then main page should open
      And there should be text Selenium user
