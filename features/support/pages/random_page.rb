class RandomPage
  include PageObject

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url']['test2']}Special:Random"

  a(:edit, text: 'Edit')
end
