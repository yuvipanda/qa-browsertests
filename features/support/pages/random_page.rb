class RandomPage
  include PageObject

  if ENV['BASE_URL']
    base_url = ENV['BASE_URL']
  else
    base_url = "test2"
  end

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url'][base_url]}Special:Random"

  a(:edit, text: 'Edit')
end
