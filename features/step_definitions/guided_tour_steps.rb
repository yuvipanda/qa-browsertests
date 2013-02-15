

When /^I append \?tour=gettingstarted to the page URL$/ do
  @browser.goto(@browser.url + '?tour=gettingstarted')
end

Then /^I should see the guider lightbox$/ do
  on(TourPage).guider1_element.should exist
end

Given /^I am on a page with Ready to Help lightbox$/ do
  step 'I am at random page'
  step 'I append ?tour=gettingstarted to the page URL'
end

When /^I click Okay$/ do
  on(TourPage).okay
end

Then /^I should see a Click Edit popup$/ do
  on(TourPage).guider2_element.should exist
end

Given /^I am on a page with Click Edit popup$/ do
  step 'I am on a page with Ready to Help lightbox'
  step 'I click Okay' 
end

When /^I click the Edit link on the wiki page$/ do
  on(TourPage).edit
end

Then /^I should see a Preview popup$/ do
  on(TourPage).guider3_element.should exist
end



