Given /^I am at Unix page$/ do
  visit UnixPage
end

When /^I click edit$/ do
  on(RandomPage).edit
end
When /^I click the Read Link$/ do
  on(EditPage).read
end
When /^I click the View History Link$/ do
  on(EditPage).view_history
end

Then /^Edit controls should be there$/ do
  on(EditPage) do |page|
    page.bold_element.should exist
    page.italic_element.should exist
    page.sig_element.should exist
    page.link_element.should exist
    page.embedded_element.should exist
    page.reference_element.should exist
    page.advanced_element.should exist
    page.special_element.should exist
  end
end
Then /^Edit controls should not be there$/ do
  on(EditPage) do |page|
    page.bold_element.should_not exist
    page.italic_element.should_not exist
    page.sig_element.should_not exist
    page.link_element.should_not exist
    page.embedded_element.should_not exist
    page.reference_element.should_not exist
    page.advanced_element.should_not exist
    page.special_element.should_not exist
  end
end
Then /^Edit link should be there$/ do
  on(EditPage).read_element.should exist
end
Then /^edit page should open$/ do
  @browser.url.should match Regexp.escape('&action=edit')
end
Then /^Preview button should be there$/ do
  on(EditPage).preview_element.should exist
end
Then /^Preview button should not be there$/ do
  on(EditPage).preview_element.should_not exist
end
Then /^Read link should be there$/ do
  on(EditPage).read_element.should exist
end
Then /^Save button should be there$/ do
  on(EditPage).save_element.should exist
end
Then /^Save button should not be there$/ do
  on(EditPage).save_element.should_not exist
end
Then /^Show Changes button should be there$/ do
  on(EditPage).show_changes_element.should exist
end
Then /^Show Changes button should not be there$/ do
  on(EditPage).show_changes_element.should_not exist
end
Then /^View History link should be there$/ do
  on(EditPage).view_history_element.should exist
end
