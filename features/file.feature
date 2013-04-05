Feature: File

 Scenario: Anonymous goes to file that does not exist
   Given I am at file that does not exist
   Then page text should contain No file by this name exists.

 @login
 Scenario: Logged-in user goes to file that does not exist
   Given I am logged in
     And I am at file that does not exist
   Then page text should contain No file by this name exists, but you can upload it.
