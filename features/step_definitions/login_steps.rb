Given /^I am at (.+) Log in page$/ do |site|
  base_url = @config['base_url'][site]
  visit(LoginPage, using_params: {base_url: base_url})
end

When /^I log in with incorrect password$/ do
  on(LoginPage).login_with(@mediawiki_username, 'incorrect password')
end
When /^I log in with incorrect username$/ do
  on(LoginPage).login_with('incorrect username', @mediawiki_password)
end
When /^I log in without entering credentials$/ do
  on(LoginPage).login_with('', '')
end
When /^I log in without entering password$/ do
  on(LoginPage).login_with(@mediawiki_username, '')
end
When /^Log in as (.+)$/ do |username|
  on(LoginPage).login_with(username, @mediawiki_password)
end

Then /^feedback should be (.+)$/ do |feedback|
  on(LoginPage).feedback.should match Regexp.escape(feedback)
end
Then /^Log in element should be there$/ do
  on(LoginPage).login_element.should exist
end
Then /^Log in page should open$/ do
  @browser.url.should match /Special:UserLogin/
  @browser.execute_script('return mw.loader.getModuleNames().filter(function (module) { return mw.loader.getState(module) === "error"; }).length === 0;').should be_true
end
Then /^Password element should be there$/ do
  on(LoginPage).password_element.should exist
end
Then /^there should be text (.+)$/ do |text|
  on(LoginPage).logged_in_as_element.text.should == text
end
Then /^Username element should be there$/ do
  on(LoginPage).username_element.should exist
end

