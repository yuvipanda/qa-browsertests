Given /^I am at page that does not exist$/ do
  visit DoesNotExistPage
end

Then /^link Create should be there$/ do
  on(DoesNotExistPage).create_element.should exist
end
Then /^page text should contain (.+)$/ do |text|
  on(DoesNotExistPage).page_text.should match Regexp.escape(text)
end
