class BogusPage
  include PageObject

  if ENV['BROWSER_NAME'] == "android" or  ENV['BROWSER_NAME'] == "iphone"
    site = "testm"
  else
    site = "test"
  end

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url'][site]}Bogus_page"

  a(:search_for_page, :text => 'search for Bogus page in Wikipedia')
end
