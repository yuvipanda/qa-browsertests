Given /^I am at random page$/ do
  visit RandomPage
end

When /^I click the Search button$/ do
  on(SearchPage).search_button
end
When /^I search for: (.+)$/ do |search_term|
  on(SearchPage).search_input= search_term
end

Then /^a list of suggested pages should appear$/ do
  on(SearchPage).search_results_element.when_present.should exist
end
Then /^I should land on Search Results page$/ do
  on(SearchResultsPage).search_element.when_present
  @browser.url.should match Regexp.escape('&title=Special%3ASearch')
end
Then /^(.+) should be the first result$/ do |page_name|
  on(SearchPage).one_result.should == page_name
end

Given(/^that I am on the Portuguese Wikivoyage Main page pt\.wikivoyage\.org$/) do
  visit PtWikivoyageMainPage
end
When(/^I search for "(.*?)"$/) do |text|
  on(PtWikivoyageMainPage).search = text
  on(PtWikivoyageMainPage).searchbutton
end

Then(/^the page I arrive on has title "(.*?)"$/) do |title|
 on(PtWikivoyageMainPage).has_expected_title?
end
