Given /^I am at random translate wiki page$/ do
  visit(RandomTranslateWikiPage)
end

When /^I click language selector trigger element$/ do
  on(RandomTranslateWikiPage).uls_trigger
end

Then /^I should see the Language selector$/ do
  on(RandomTranslateWikiPage).search_element.should exist
end
