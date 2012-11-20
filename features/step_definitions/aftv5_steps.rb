Given /^I am at a random article$/ do
  visit AftV5Page
  @random_string = ('a' .. 'z').to_a.shuffle[0,10].join
end

When /^The AFTv5 element appears$/ do
  #on(AftV5Page).aft_box_element.should be_true
  on(AftV5Page) do |page|
    page.aft_box_element.should be_true
    #page.send_keys :space

  end
end

Then /^I can click Yes and No and always return to AFT input$/ do
  on_page(AftV5Page) do |page|
    page.yes_span_element.exists?
    page.yes_span_element.when_present.click
    page.back_to_yesno
    page.no_span_element.when_present.click
    page.back_to_yesno
    page.yes_span_element.should be_true
    page.no_span_element.should be_true
  end
end

Then /^Help improve this page text appears$/ do
  on_page(AftV5Page) do |page|
    page.text.should include "Help improve this page"
  end
end

And /^I can click Whats this and see a floating text window$/ do
  on_page(AftV5Page) do |page|
    page.float_tip
    page.text.should include "Wikipedia would like to hear what you think of this article. Share your feedback with the editors -- and help improve this page"
    page.learn_more_element.should be_true
  end
end

And /^When I click Yes I see helpful feedback guide and terms$/ do
  on_page(AftV5Page) do |page|
    page.yes_span_element.when_present.click
    page.helpful_feedback_element.should be_true
    page.terms_element.should be_true
  end
end

And /^I can enter and save text$/ do
  on_page(AftV5Page) do |arg|
    @page = arg
    @page.input_area_element.send_keys "Automated test wrote this feedback" + @random_string
    @page.post_feedback_element.when_present.click
    @page.wait_until(10) do
      @page.text.include? "Thanks!"
    end
    @page.text.should include "Your post can be viewed on this feedback page."
    #ONLY ANONS GET 'CREATE ACCOUNT'/LOG IN MESSAGE
    @page.create_account_element.should be_true
    @page.log_in_element.should be_true
  end
end

And /^After saving I have links to feedback page and See all comments available$/ do
  on_page(AftV5Page) do |page|
    page.feedback_page_element.when_present.click
    page.all_comments_element.should be_true
  end
end

And /^When I click to navigate to comments page my saved comment appears$/ do
  on_page(AftV5Page) do |page|
    page.all_comments_element.when_present.click
    page.text.should include "Automated test wrote this feedback" + @random_string
  end
end

And /^Comments are shown Relevant and All and Sort By$/ do
  on_page(AftV5Page) do |page|
    page.most_relevant.should be_true
    page.sort_by_element.should be_true
  end
end

And /^I have links to Learn more and View Article$/ do
  on_page(AftV5Page) do |page|
    page.learn_more_element.should be_true
    page.view_article_element.should be_true
  end
end

