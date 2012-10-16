class BogusPage
  include PageObject

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url']}Bogus_page"

  a(:search_for_page, :text => 'search for Bogus page in Wikipedia')
end
