class DescribePage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  text_field(:title, id: "title0")
end
