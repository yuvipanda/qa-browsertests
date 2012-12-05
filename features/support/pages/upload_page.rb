class UploadPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('Special:UploadWizard')
  end
  page_url url

  span(:continue, text: 'Continue')
  file_field(:select_file, name: 'file')
end
