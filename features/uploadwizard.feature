Feature: UploadWizard

  Scenario: Navigate to Learn page
    Given I am logged in
    When I navigate to Upload Wizard
    Then Learn page should appear
      And Skip this step in the future checkbox should be there

  Scenario: Navigate to Upload page
    Given I am logged in
    When I navigate to Upload Wizard
      And I click Next button
    Then Upload page should appear
      And Select a media file to donate button should be there

  Scenario: Navigate to Release rights page
    Given I am logged in
    When I navigate to Upload Wizard
      And I click Next button
      And upload file image.png
      And click button Continue
    Then Release rights page should open
      And Next button should be there

  Scenario: Run UploadWizard
    Given Login is required to upload
    When I navigate to Upload Wizard
    Then the learn screen should appear
      And I should be able to upload a file and pick copyright info
      And Source and Author are required
      And Title Description Location can be set
      And I can navigate back to UW
      And I can upload two more files
