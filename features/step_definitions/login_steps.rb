Given /^I am at (.+) Log in page$/ do |site|
  base_url = @config['base_url'][site]
  visit(LoginPage, using_params: {base_url: base_url})
end

When /^I log in without entering credentials$/ do
  on(LoginPage).login_with('', '')
end
When /^Log in as (.+)$/ do |username|
  on(LoginPage).login_with(username, @mediawiki_password)
end

Then /^feedback should be (.+)$/ do |feedback|
  on(LoginPage).feedback.should match feedback
end
Then /^Log in element should be there$/ do
  on(LoginPage).login_element.should exist
end
Then /^Log in page should open$/ do
  @browser.url.should match /Special:UserLogin/
end
Then /^Password element should be there$/ do
  on(LoginPage).password_element.should exist
end
Then /^there should be text (.+)$/ do |text|
  on(LoginPage).logged_in_as_element.text.should match text
end
Then /^Username element should be there$/ do
  on(LoginPage).username_element.should exist
end

