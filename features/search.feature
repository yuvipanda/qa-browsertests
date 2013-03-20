Feature: Search

  Scenario: Search suggestions
    Given I am at random page
    When I search for: main
    Then a list of suggested pages should appear
      And Main Page should be the first result

 Scenario: Fill in search term and click search
    Given I am at random page
    When I search for: ma
      And I click the Search button
    Then I should land on Search Results page

  Scenario:  Search with accent yields result page with accent
    Given that I am on the Portuguese Wikivoyage Main page pt.wikivoyage.org
    When I search for "África"
    Then the page I arrive on has title "África"

  Scenario: Search without accent yields optimal accent result as top choice but shows redlink for search term.  THIS TEST EMULATES CURRENT FUNCTION.
    Given that I am on the Portuguese Wikivoyage Main page pt.wikivoyage.org
    When I search for "Africa"
    Then I should be on the Search Results page
      And the page entitled "África" should be the top result
      And the results page should show Africa as a red link
