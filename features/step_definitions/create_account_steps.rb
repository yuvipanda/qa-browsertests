Given /^I go to a Create account page$/ do
  visit CreateAccountPage
end

Then /^form has Create account button$/ do
  on(CreateAccountPage).create_account_element.should exist
end
