# before all
require "bundler/setup"
require "page-object"
require "page-object/page_factory"
require "require_all"
require "watir-webdriver"
require "yaml"

World(PageObject::PageFactory)

def browser(environment)
  if environment == :cloudbees
    sauce_browser
  else
    local_browser
  end
end
def environment
  if ENV['ENVIRONMENT'] == "cloudbees"
    :cloudbees
  else
    :local
  end
end
def local_browser
  Watir::Browser.new :firefox
end
def sauce_browser
  config = YAML.load_file('config/config.yml')
  browser_label = config[ENV['BROWSER_LABEL']]

  caps = Selenium::WebDriver::Remote::Capabilities.send(browser_label['name'])
  caps.platform = browser_label['platform']
  caps.version = browser_label['version']

  secret = YAML.load_file('config/secret.yml')
  Watir::Browser.new(
    :remote,
    :url => "http://#{secret['username']}:#{secret['key']}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
end

browser = browser(environment)

Before do |scenario|
  @browser = browser
end

at_exit do
  browser.close
end
