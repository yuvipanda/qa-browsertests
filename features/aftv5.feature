Feature: AftV5

  Scenario: Leave feedback and check AFT
    Given I am at a random page with AFT
    When The AFTv5 element appears
    Then I can click Yes and No and always return to AFT input
      And can click What's this? and see a floating text window
      And When I click Yes I see helpful feedback guide and terms
      And I can enter and save text
      And After saving I have links to feedback page and See all comments available
      And When I click to navigate to comments page my saved comment appears
      And Comments are shown Relevant and All and Sort By
      And I have links to Learn more and View Article
