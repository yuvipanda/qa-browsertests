Given /^I am at page that does not exist$/ do
  visit(DoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

When /^I click link Create$/ do
  on(DoesNotExistPage).create
end

Then /^link Create should be there$/ do
  on(DoesNotExistPage).create_element.should exist
end
Then /^page text should contain (.+)$/ do |text|
  on(DoesNotExistPage).page_text.should match Regexp.escape(text)
end
