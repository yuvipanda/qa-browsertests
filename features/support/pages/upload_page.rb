class UploadPage
  include PageObject
  include URLModule

  def self.url
    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][URLModule.base_url]}Special:UploadWizard"
  end
  page_url url

  file_field(:select_file, name: "file")
  span(:continue, text: "Continue")
end
