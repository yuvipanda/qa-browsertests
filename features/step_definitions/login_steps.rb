Given /^I am at Log in page$/ do
  visit(LoginPage)
end

When /^I log in without entering credentials$/ do
  on(LoginPage).login_with("", "")
end

Then /^Log in button should be there$/ do
  on(LoginPage).login_element.should exist
end
Then /^Log in page should open$/ do
  @browser.url.should match /Special:UserLogin/
end
Then /^feedback should be (.+)$/ do |feedback|
  on(LoginPage).feedback.should match feedback
end
