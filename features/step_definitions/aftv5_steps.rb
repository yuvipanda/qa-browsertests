Given /^I am at an AFT page$/ do
  visit AftV5Page
end

When /^I click Whats this$/ do
  on(AftV5Page) do |page|
    page.float_tip
  end
end
When /^I click Yes$/ do
  on(AftV5Page) do |page|
    page.yes_span_element.when_present.click
  end
end
When /^I click Yes and No$/ do
  on(AftV5Page) do |page|
    page.yes_span_element.exists?
    page.yes_span_element.when_present.click
    page.back_to_yesno
    page.no_span_element.when_present.click
    page.back_to_yesno
  end
end

Then /^AFT should be there$/ do
  on(AftV5Page).yes_span_element.should exist
end
Then /^After saving I have links to feedback page and See all comments available$/ do
  on(AftV5Page) do |page|
    page.feedback_page_element.when_present.click
    page.all_comments_element.should be_true
  end
end
Then /^Comments are shown Relevant and All and Sort By$/ do
  on(AftV5Page) do |page|
    page.most_relevant.should be_true
    page.sort_by_element.should be_true
  end
end
Then /^I can always return to AFT input$/ do
  on(AftV5Page) do |page|
    page.yes_span_element.should be_true
    page.no_span_element.should be_true
  end
end
Then /^I can enter and save text$/ do
  on(AftV5Page) do |page|
    @input_string = "Automated test did this #{('a' .. 'z').to_a.shuffle[0,10].join}"
    page.input_area_element.send_keys "Hello from #{@input_string}"
    page.post_feedback_element.when_present.click
    page.wait_until(10) do
      page.text.include? "Thanks!"
    end
    page.text.should include "Your post can be viewed on this feedback page."
    #ONLY ANONS GET 'CREATE ACCOUNT'/LOG IN MESSAGE
    page.create_account_element.should be_true
    page.log_in_element.should be_true
  end
end
Then /^I have links to Learn more and View Article$/ do
  on(AftV5Page) do |page|
    page.learn_more_element.should be_true
    page.view_article_element.should be_true
  end
end
Then /^I see a floating text window with Learn more link$/ do
  on(AftV5Page) do |page|
    page.text.should include "Wikipedia would like to hear what you think of this article. Share your feedback with the editors -- and help improve this page"
    page.learn_more_element.should be_true
  end
end
Then /^I see helpful feedback guide and terms$/ do
  on(AftV5Page) do |page|
    page.helpful_feedback_element.should be_true
    page.terms_element.should be_true
  end
end
Then /^When I click to navigate to comments page my saved comment appears$/ do
  on(AftV5Page) do |page|
    page.all_comments_element.when_present.click
    page.wait_until(10) do
      page.text.include? @input_string
    end
  end
end
