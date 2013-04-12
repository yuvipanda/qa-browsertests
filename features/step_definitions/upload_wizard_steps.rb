Given /^I am logged in$/ do
  visit(LoginPage).login_with(@mediawiki_username, @mediawiki_password)
end

When /^click button Continue$/ do
  on(UploadPage).continue_element.when_present.click
end
When /^I click Next button$/ do
  on(UploadWizardPage).next_element.when_present.click
end
When /^I click Next button at Describe page$/ do
  sleep 1 # todo # I can not figure out at the moment how to make this work without using sleep
  on(DescribePage).next_element.click
end
When /^I click Next button at Learn page$/ do
  on(LearnPage).next_element.click
end
When /^I click Next button at Release rights page$/ do
  on(ReleaseRightsPage).next_element.click
end
When /^I click This file is my own work$/ do
  on(ReleaseRightsPage).select_my_own_work
end
When /^I enter description$/ do
  on(DescribePage).description = 'description'
end
When /^I enter title$/ do
  on(DescribePage).title = "Title #{Random.new.rand}"
end
When /^I navigate to Upload Wizard$/ do
  # TODO: add more checks for this page
  visit(UploadWizardPage).tutorial_map.should be_true
end
When /^upload file (.+)$/ do |file_name|
  require 'chunky_png'
  ChunkyPNG::Image.new(Random.new.rand(255), Random.new.rand(255), Random.new.rand(255)).save file_name
  path = Dir.pwd + '/' + file_name
  if @browser.driver.browser == :chrome
    @browser.execute_script 'document.getElementsByName("file")[0].removeAttribute("class");'
    @browser.execute_script 'document.getElementsByName("file")[0].removeAttribute("style");'
  end
  on(UploadPage).select_file = path
end

Then /^(.+) checkbox should be there$/ do |_|
  on(LearnPage).skip_element.should exist
end
Then /^Describe page should open$/ do
  @browser.url.should == on(DescribePage).class.url
end
Then /^Learn page should appear$/ do
  @browser.url.should == on(UploadWizardPage).class.url
end
Then /^Next button should be there$/ do
  on(ReleaseRightsPage).next_element.should be_visible
end
Then /^Release rights page should open$/ do
  @browser.url.should == on(ReleaseRightsPage).class.url
end
Then /^Select a media file to donate button should be there$/ do
  on(UploadPage).select_file_element.should exist
end
Then /^title text field should be there$/ do
  on(DescribePage).title_element.should exist
end
Then /^Upload more files button should be there$/ do
  on(UsePage) do |page|
    page.upload_more_files_element.when_present
    page.upload_more_files_element.should be_visible
  end
end
Then /^Upload page should appear$/ do
  @browser.url.should == on(UploadPage).class.url
end
Then /^Use page should open$/ do
  @browser.url.should == on(UsePage).class.url
end
