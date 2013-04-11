Given /^that my browser's accept language is (.+)$/ do |language|
  @browser = browser(environment, test_name(@scenario), @saucelabs_username, @saucelabs_key, language)
end

When /^I visit a random page$/ do
  visit(RandomPage)
end

Then /^link to the main page has text (.+)$/ do |text|
  on(RandomPage).main_page_element.text.should == text
end
