class UsePage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  span(:upload_more_files, text: "Upload more files")
end
