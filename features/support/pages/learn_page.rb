class LearnPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  checkbox(:skip, id: 'mwe-upwiz-skip')
end
