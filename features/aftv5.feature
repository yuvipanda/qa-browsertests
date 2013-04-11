# http://www.mediawiki.org/wiki/Article_feedback/Version_5/Feature_Requirements#Platforms @ie6-bug @phantomjs-bug
@ie6-bug @phantomjs-bug
Feature: AFTv5

  Background:
    Given I am at an AFTv5 page

  Scenario: Check if AFTv5 is on the page
    Then AFTv5 should be there

  Scenario: Click Yes return and click No
    When I click Yes and No
    Then I can always return to AFTv5 input

  Scenario: Check Whats this with Learn more
    When I click Whats this
    Then I see a floating text window with Learn more link

  Scenario: Click yes and see feedback guide and terms
    When I click Yes
    Then I see helpful feedback guide and terms

  Scenario: Click yes and leave feedback
    When I click Yes
    Then I can enter and save text
