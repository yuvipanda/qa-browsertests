Feature: Math

  Scenario: Display simple math
    Given I am editing My sandbox page
    When I type <math>3 + 2</math>
      And I click Preview
    Then My sandbox page should contain an img tag
      And alt for that img should be 3 + 2
      And src for that img should come from //upload.wikimedia.org/math/
