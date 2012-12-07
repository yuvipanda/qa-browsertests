Given /^I am at random page$/ do
  visit RandomPage
end

When /^I search for: (.+)$/ do |search_term|
  on(SearchPage).search_input= search_term
end

Then /^a list of suggested pages should appear$/ do
  on(SearchPage).search_results_element.when_present.should exist
end

Then /^(.+) should be the first result$/ do |page_name|
  on(SearchPage).one_result.should == page_name
end

And /^I click the Search button$/ do
  on(SearchPage).search_button
end

Then /^I should land on Search Results page$/ do
  @browser.url.should match '&button=&title=Special%3ASearch$'
end
