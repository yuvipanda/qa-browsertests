Feature: Guided Tour

  Scenario: Check for Ready to Help lightbox
    Given I am at random page
    When I append ?tour=gettingstarted to the page URL 
    Then I should see the guider lightbox

  Scenario: Check for Click Edit popup
    Given I am on a page with Ready to Help lightbox
    When I click Okay
    Then I should see a Click Edit popup

  Scenario: Check for Preview popup
    Given I am on a page with Click Edit popup
    When I click the Edit link on the wiki page
    Then I should see a Preview popup
    


  



