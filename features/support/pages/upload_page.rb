class UploadPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  file_field(:select_file, name: "file")
  span(:continue, text: "Continue")
end
