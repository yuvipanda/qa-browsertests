Given /^I am on the Mobile website$/ do
  visit(MobilePage) do |page|
    page.text.should include "Today's featured article"
  end
end

When /^I type (.+)$/ do |search_term|
  on(MobilePage) do |page|
    page.search_box_element.should be_true
    page.search_box= search_term
  end
end

Then /^Search results should contain (.+)$/ do |text|
  # http://www.mediawiki.org/wiki/Mobile/Testing_process#SmartPhone
  pending if ENV['BROWSER_LABEL'] and ENV['BROWSER_LABEL'].match /internet_explorer_(6|7|10)/

  on(MobilePage).search_result_element.when_present.text.should == text
end
