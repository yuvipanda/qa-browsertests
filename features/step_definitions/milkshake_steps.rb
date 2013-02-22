Given /^I am not logged in$/ do
end

When /^I go to translate page$/ do
  visit(TranslatePage)
end

Then /^translate page should open$/ do
  @browser.url.should == on(TranslatePage).class.url
end

Then /^proofread link should exist$/ do
  on(TranslatePage).proofread_element.should exist
end
