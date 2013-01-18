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
