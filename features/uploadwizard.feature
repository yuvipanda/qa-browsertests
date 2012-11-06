Feature: Uploadwizard

   Scenario: Run UploadWizard
      Given Login is required to upload
      When I navigate to Upload Wizard
      Then the learn screen should appear
      And I should be able to upload a file and pick copyright info
      And Source and Author are required
      And Title Description Location can be set
      And I can navigate back to UW
      And I can upload two more files
