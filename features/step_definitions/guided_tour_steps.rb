

When /^I append \?tour=gettingstarted to the page URL$/ do
  @browser.goto(@browser.url + '?tour=gettingstarted')
end

Then /^I should see the guider lightbox$/ do
  on(TourPage).guider_element.should exist
end

