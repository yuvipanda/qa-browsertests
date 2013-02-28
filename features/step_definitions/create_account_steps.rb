Given /^I go to Create account page at (.+)$/ do |path|
  visit(CreateAccountPage, :using_params => {:page_title => path})
end

Then /^form has Create account button$/ do
  on(CreateAccountPage).create_account_element.should exist
end
