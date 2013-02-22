Given /^that my browser's accept language is de$/ do
  @browser.close

  profile = Selenium::WebDriver::Firefox::Profile.new
  profile['intl.accept_languages'] = 'de'
  @browser = Watir::Browser.new :firefox, :profile => profile
end

When /^I visit a random page$/ do
  visit(RandomTranslateWikiPage)
end

Then /^link to the main page has text Hauptseite$/ do
  on(RandomTranslateWikiPage).main_page_element.text.should == 'Hauptseite'
end
