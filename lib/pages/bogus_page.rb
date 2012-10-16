class BogusPage
  include PageObject

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url']['test2']}Bogus_page"

  a(:search_for_page, :text => 'search for this page title')
end
