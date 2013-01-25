Feature: UploadWizard

  Background:
    Given I am logged in
    When I navigate to Upload Wizard

  Scenario: Navigate to Learn page
    Then Learn page should appear
      And Skip this step in the future checkbox should be there

  Scenario: Navigate to Upload page
    When I click Next button at Learn page
    Then Upload page should appear
      And Select a media file to donate button should be there

  @phantomjs-bug
  Scenario: Navigate to Release rights page
    When I click Next button at Learn page
      And upload file image.png
      And click button Continue
    Then Release rights page should open
      And Next button should be there

  @phantomjs-bug
  Scenario: Navigate to Describe page
    When I click Next button at Learn page
      And upload file image.png
      And click button Continue
      And I click This file is my own work
      And I click Next button at Release rights page
    Then Describe page should open
      And title text field should be there

  @phantomjs-bug
  Scenario: Navigate to Use page
    When I click Next button at Learn page
      And upload file image.png
      And click button Continue
      And I click This file is my own work
      And I click Next button at Release rights page
      And I enter title
      And I enter description
      And I click Next button at Describe page
    Then Use page should open
      And Upload more files button should be there
