Given /^that my browser's accept language is (.+)$/ do |language|
  @browser.close

  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['intl.accept_languages'] = language
  @browser = Watir::Browser.new :firefox, :profile => profile
end

When /^I visit a random page$/ do
  visit(RandomTranslateWikiPage)
end

Then /^link to the main page has text (.+)$/ do |text|
  on(RandomTranslateWikiPage).main_page_element.text.should == text
end
