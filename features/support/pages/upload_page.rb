class UploadPage
  include PageObject

  def self.url
    if ENV['BASE_URL']
      base_url = ENV['BASE_URL']
    else
      base_url = "test2"
    end

    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][base_url]}Special:UploadWizard"
  end
  page_url url

  file_field(:select_file, name: "file")
end
