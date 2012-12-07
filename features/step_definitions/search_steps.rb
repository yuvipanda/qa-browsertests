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
