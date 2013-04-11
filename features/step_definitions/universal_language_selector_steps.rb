When /^I click language selector trigger element$/ do
  on(RandomPage).uls_trigger
end

Then /^I should see the Language selector$/ do
  on(RandomPage).search_element.should exist
end
