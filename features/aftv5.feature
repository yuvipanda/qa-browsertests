Feature: AftV5

  Scenario: Check if AFT is on the page
    Given I am at an AFT page
    Then AFT should be there
    
  Scenario: Click Yes return and click No
    Given I am at an AFT page
    When I click Yes and No
    Then I can always return to AFT input

  Scenario: Check Whats this with Learn more
    Given I am at an AFT page
    When I click Whats this
    Then I see a floating text window with Learn more link

  Scenario: Click yes and see feedback guide and terms
    Given I am at an AFT page
    When I click Yes
    Then I see helpful feedback guide and terms

  Scenario: Click yes and leave feedback
    Given I am at an AFT page
    When I click Yes
    Then I can enter and save text
      And After saving I have links to feedback page and See all comments available
      And When I click to navigate to comments page my saved comment appears
      And Comments are shown Relevant and All and Sort By
      And I have links to Learn more and View Article
