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

When(/^I search for (.+)$/) do |text|
  on(RandomPage) do |page|
    page.search_input = text
    page.search_button
  end
end

Then(/^the page I arrive on has title (.+)$/) do |title|
 @browser.title.should match Regexp.escape(title)
end
