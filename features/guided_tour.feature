Feature: Guided Tour
  Scenario: Landing page

    Given I am at random page
    When I append ?tour=gettingstarted to the page URL 
    Then I should see the guider lightbox

