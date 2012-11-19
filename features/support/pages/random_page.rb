class RandomPage
  include PageObject
  include URLModule

  def self.url
    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][URLModule.base_url]}Special:Random"
  end
  page_url url

  a(:edit, text: 'Edit')
end
