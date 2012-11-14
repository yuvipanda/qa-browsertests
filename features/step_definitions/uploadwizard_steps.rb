Given /^I am logged in$/ do
  config = YAML.load_file('config/config.yml')
  username = config['tests']['username']
  password = SECRET['uw_password']
  visit(LoginPage).login_with(username, password)
end
Given /^Login is required to upload$/ do
  visit_page(UploadWizardPage)
  @current_page.logged_in
  @current_page.text.should include "Log in / create account"
  config = YAML.load_file('config/config.yml')
  username = config['tests']['username']
  password = SECRET['uw_password']
  on_page(LoginPage).login_with(username, password)
end

When /^I click Next button$/ do
  on(UploadWizardPage).next_element.click
end
When /^I navigate to Upload Wizard$/ do
  visit_page(UploadWizardPage)
  @current_page.text.include? "Thanks for using our new upload tool!Help with translations"
  @current_page.tutorial_map.should be_true
end

Then /^Learn page should appear$/ do
  @browser.url.should == on(UploadWizardPage).class.url
end
Then /^(.+) checkbox should be there$/ do |_|
  on(LearnPage).skip_element.should exist
end
Then /^Upload page should appear$/ do
  @browser.url.should == on(UploadPage).class.url
end
Then /^Select a media file to donate button should be there$/ do
  on(UploadPage).select_file_element.should exist
end
Then /^the learn screen should appear$/ do
  on_page(UploadWizardPage) do |page|
    page.skip_radio_element.when_visible
    page.check_skip_radio
    page.skip_radio_checked?.should be_true
    page.uncheck_skip_radio
    page.skip_radio_checked?.should be_false
    page.next_element.click
  end
end
And /^I should be able to upload a file and pick copyright info$/ do
  on_page(UploadWizardPage) do |arg|
    @page = arg

    config = YAML.load_file('config/config.yml')
    files = config['tests']['files']
    @page.select_file = File.dirname(__FILE__) + files['never_uploaded']

    #sleep 5
    #refactor these waits
    @page.wait_until(20) do
      @page.text.include? "All uploads were successful!"
    end
    @page.continue_button
    #own work
    @page.wait_until(5) do
      @page.text.include? "This site requires you to provide copyright information for this work, to make sure everyone can legally reuse it"
    end
    @page.select_own_work_button
    @page.text.should include "the copyright holder of this work, irrevocably grant anyone the right to use this work under the Creative Commons Attribution ShareAlike 3.0 license"
    @page.legal_code_recommended_element.should be_true
    @page.next_element.should be_true
    @page.author_element.should be_true
    @page.different_license

    #refactor this, see below
    @page.legal_code_cc_sa3_element.should be_true
    @page.legal_code_cca3_element.should be_true
    @page.legal_code_cc_waiver_element.should be_true

    @page.select_cca_sa
    @page.select_cca3
    @page.select_cc_cc
    #third party
    @page.select_third_party_button
    sleep 3
    @page.cc
    @page.flickr
    @page.expired
    @page.us_govt
    @page.not_mentioned
    @page.found_it

    #refactor this
    @page.legal_code_cc_sa3_element.should be_true
    @page.legal_code_cca3_element.should be_true
    @page.legal_code_cc_waiver_element.should be_true
    @page.legal_code_cc_sa25_element.should be_true
    @page.legal_code_cca25_element.should be_true

    @page.believe_free_selected?
    @page.select_cca_sa3
    @page.select_cca_sa2
    @page.select_cca3_2
    @page.select_cca2
    @page.select_cc_waiver
    @page.select_cca_sa20
    @page.select_cca_2_2
    @page.select_us_govt_2
    @page.select_pre_1923
    @page.select_repro
    @page.select_us_govt_3
    @page.select_nasa
    @page.select_free_form
    @page.free_lic_element.should be_true
  end
end
And /^Source and Author are required$/ do
  on_page(UploadWizardPage) do |arg|
    @page = arg
    @page.next_button_element.click
    # improve this, like a regex for "glob:This field is required*Source*This field is required*Author"
    @page.wait_until(5) do
      @page.text.include? "This field is required"
    end
    #@page.text.should include "This field is required"
  end
end
And /^Title Description Location can be set$/ do
  on_page(UploadWizardPage) do |arg|
    @page = arg
    @page.own_work_button_element.click
    @page.next_button_element.click
    @page.wait_until(5) do
      @page.text.include? "Description"
    end

    @page.title_field_element.click
    @page.title_field_element.clear
    @page.title_field_element.send_keys "DSC_002"
    @page.title_field_element.click
    # This test is broken.
    @page.wait_until(5) do
      # There are two possible values, depending on the blacklist entries for the site.
      #@page.text.include? "Please choose a different, descriptive title." or @page.text.include? "Please make this title more meaningful."
      @page.text.include? "Please"
    end

    @page.title_field_element.send_keys("Automated test title")
    @page.description_field_element.send_keys("Automated testing created this description")
    # LANGUAGE SELECT CONTENT VARIES BY ENV @page.language.should include "English"
    @page.date_created_element.send_keys("Automated test")
    @page.categories
    @page.add_categories_element.send_keys("Automated test")
    @page.latitude_element.click
    @page.latitude_element.send_keys("Automated test")
    @page.longitude_element.click
    @page.text.should include "The latitude needs to be between -90 and 90"
    @page.longitude_element.send_keys("Automated test")
    @page.other_information_element.click
    @page.text.should include "The longitude needs to be between -180 and 180"
    @page.other_information_element.send_keys("Automated test")
  end
end
And /^I can navigate back to UW$/ do
  on_page(UploadWizardPage) do |newpage|
    # Prevent alert from firing
    newpage.browser.execute_script 'window.onbeforeunload = function () {};'
  end
  visit_page(UploadWizardPage)
  on_page(UploadWizardPage) do |newpage|
    newpage.tutorial_map.should be_true
    newpage.next_element.click
  end
end
And /^I can upload two more files$/ do
  on_page(UploadWizardPage) do |arg|
    @page = arg

    config = YAML.load_file('config/config.yml')
    files = config['tests']['files']
    @page.select_file = File.dirname(__FILE__) + files['never_uploaded']

    @page.wait_until(5) do
      @page.text.include? "All uploads were successful!"
    end

    @page.select_file = File.dirname(__FILE__) + files['another_never_uploaded']

    @page.wait_until(5) do
      #@page.text.include? "All uploads were successful!"
      @page.text.include? "There was another file already on the site with the same content, but it was deleted"
    end

#    @page.continue_button
#    #own work
#    @page.wait_until(5) do
#      @page.text.include? "This site requires you to provide copyright information for these works, to make sure everyone can legally reuse them"
#    end
#    @page.select_own_work_button
#    @page.text.should include "the copyright holder of these works, irrevocably grant anyone the right to use these works under the Creative Commons Attribution ShareAlike 3.0 license"

    # I don't really care about the copyright stuff in this test, I already made sure it worked before.
#    @page.select_cca_sa
#    @page.next_button_element.click

#    @page.wait_until(5) do
#       @page.text.include? "Description"
#    end

#    @page.categories.should be_true

#    @page.copymeta.should be_true
#    @page.text.should include 'Copy title'
  end
end
