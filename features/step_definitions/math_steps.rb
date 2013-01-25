
Given /^I am editing My sandbox page$/ do
  visit(MainPage).my_sandbox
end

When /^I type (.+)$/ do |write_text|
  on(EditPage).article_text=write_text
end

When /^I click Preview$/ do
  on(EditPage).preview
end

Then /^My sandbox page should contain an img tag$/ do
  on(EditPage).math_image_element.should exist
end

Then /^alt for that img should be (.+)$/ do |alt|
  on(EditPage).math_image_element.alt.should == alt
end

Then /^src for that img should come from (.+)$/ do |src|
  on(EditPage).math_image_element.src.should match Regexp.escape(src)
end
