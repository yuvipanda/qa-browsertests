# http://www.mediawiki.org/wiki/Article_feedback/Version_5/Feature_Requirements#Platforms
@ie6-bug
Feature: AFTv5

  Scenario: Check if AFTv5 is on the page
    Given I am at an AFTv5 page
    Then AFTv5 should be there

  # https://bugzilla.wikimedia.org/show_bug.cgi?id=42551
  @ie9-bug
  Scenario: Click Yes return and click No
    Given I am at an AFTv5 page
    When I click Yes and No
    Then I can always return to AFTv5 input

  Scenario: Check Whats this with Learn more
    Given I am at an AFTv5 page
    When I click Whats this
    Then I see a floating text window with Learn more link

  Scenario: Click yes and see feedback guide and terms
    Given I am at an AFTv5 page
    When I click Yes
    Then I see helpful feedback guide and terms

  # https://bugzilla.wikimedia.org/show_bug.cgi?id=42551 ie9
  # https://bugzilla.wikimedia.org/show_bug.cgi?id=42517 ie7 ie8 ie10
  @ie9-bug @ie7-bug @ie8-bug @ie10-bug
  Scenario: Click yes and leave feedback
    Given I am at an AFTv5 page
    When I click Yes
    Then I can enter and save text
      And After saving I have links to feedback page and See all comments available
      And When I click to navigate to comments page my saved comment appears
      And Comments are shown Relevant and All and Sort By
      And I have links to Learn more and View Article
