Given /^I am on the Mobile website$/ do
  visit(MobilePage) do |page|
    page.text.should include "Today's featured article"
  end
end

When /^I type three known characters$/ do
  on(MobilePage) do |page|
    page.search_box_element.should be_true
    page.search_box='san'
  end
end

Then /^Search results matching my characters appear$/ do
  # http://www.mediawiki.org/wiki/Mobile/Testing_process#SmartPhone
  pending if ENV['BROWSER_LABEL'] and ENV['BROWSER_LABEL'].match /internet_explorer_(6|7|10)/
  on(MobilePage) do |page|
    page.wait_until(10) do
      page.text.include? 'San Francisco'
    end
  end
end
