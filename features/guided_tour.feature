Feature: Guided Tour

  Scenario: Check for Ready to Help guider
    Given I am at random page
    When I append ?tour=gettingstarted to the page URL
    Then I should see the Ready to help guider

  Scenario: Check for Click Edit guider
    Given I am on a page with Ready to Help guider
    When I click Okay
    Then I should see a Click Edit guider

  Scenario: Check for Preview guider
    Given I am on a page with Click Edit guider
    When I click the Edit link on the wiki page
    Then I should see a Preview guider

  Scenario: Check for You're almost finished guider
    Given I am on a page with Preview guider
    When I click Show Preview on the wiki page
    Then I should see a You're almost finished guider
