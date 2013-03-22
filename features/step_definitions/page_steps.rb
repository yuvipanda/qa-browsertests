Given /^I am at page that does not exist$/ do
  visit(DoesNotExistPage, using_params: {page_name: @does_not_exist_page_name})
end

When /^I click link Create$/ do
  on(DoesNotExistPage).create
end
When /^I click Save page button$/ do
  on(EditPage).save
end
When /^I enter article text$/ do
  on(EditPage).article_text = "Starting a new page using the URL"
end

Then /^Discussion link should be there$/ do
  on(ArticlePage).discussion_element.should exist
end
Then /^link Create should be there$/ do
  on(DoesNotExistPage).create_element.should exist
end
Then /^newly created page should open$/ do
  @browser.url.should match Regexp.escape(@does_not_exist_page_name.to_s)
end
Then /^page text should be there$/ do
  on(ArticlePage).page_text.should == "Starting a new page using the URL"
end
Then /^page text should contain (.+)$/ do |text|
  on(DoesNotExistPage).page_text.should match Regexp.escape(text)
end
Then /^page title should be there$/ do
  on(ArticlePage).title.should match Regexp.escape(@does_not_exist_page_name.to_s)
end
Then /^text box with page text should be there$/ do
  on(EditPage).article_text_element.should exist
end
Then /^watchlist element should not be there$/ do
  on(ArticlePage).watchlist_element.should_not exist
end
Given(/^I am on a newly created page with article text$/) do
  step 'I am at page that does not exist'
  step 'I click link Create'
  step 'I enter article text'
  step 'I click Save page button'
end

When(/^I click Move$/) do
  on(ArticlePage).actions_link
  on(ArticlePage).move_link
end

Then(/^I should be on a page that says Move newly created page$/) do
  @browser.url.should match /Special:MovePage/
  @browser.text.should match /Move page: #{@does_not_exist_page_name}/
end

Then(/^I should see a Namespace selectbox$/) do
  on(MovePage).namespace_element.should exist
end

Then(/^I should see a To new title textbox$/) do
  on(MovePage).new_title_element.should exist
end

Then(/^I should see a Reason textarea$/) do
  on(MovePage).reason_element.should exist
end

Then(/^I should see a Leave a redirect radio button$/) do
  on(MovePage).leave_redirect_element.should exist
end

Then(/^I should see a Watch source page radio button$/) do
  on(MovePage).watch_source_element.should exist
end

