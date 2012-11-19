class LearnPage
  include PageObject
  include URLModule

  def self.url
    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][URLModule.base_url]}Special:UploadWizard"
  end
  page_url url

  checkbox(:skip, id: "mwe-upwiz-skip")
end
