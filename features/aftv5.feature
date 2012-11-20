Feature: AftV5

  Scenario: Click Yes return and click No
    Given I am at a random article
    When The AFTv5 element appears
    Then I can click Yes and No and always return to AFT input

  Scenario: Check Whats this and helpful feedback and terms
    Given I am at a random article
    When The AFTv5 element appears
    Then Help improve this page text appears
      And I can click Whats this and see a floating text window
      And When I click Yes I see helpful feedback guide and terms

  Scenario: Click yes and leave feedback
    Given I am at a random article
    When The AFTv5 element appears
    Then Help improve this page text appears
      And When I click Yes I see helpful feedback guide and terms
      And I can enter and save text

  Scenario: Click yes and leave feedback
    Given I am at a random article
    When The AFTv5 element appears
    Then Help improve this page text appears
      And When I click Yes I see helpful feedback guide and terms
      And I can enter and save text
      And After saving I have links to feedback page and See all comments available
      And When I click to navigate to comments page my saved comment appears

  Scenario: Click yes and leave feedback
    Given I am at a random article
    When The AFTv5 element appears
    Then Help improve this page text appears
      And When I click Yes I see helpful feedback guide and terms
      And I can enter and save text
      And After saving I have links to feedback page and See all comments available
      And When I click to navigate to comments page my saved comment appears
      And Comments are shown Relevant and All and Sort By
      And I have links to Learn more and View Article
