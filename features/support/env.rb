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
  if ENV['BROWSER_NAME']
    browser = ENV['BROWSER_NAME']
  else
    browser = 'firefox'
  end

  config = YAML.load_file('config/config.yml')
  caps = Selenium::WebDriver::Remote::Capabilities.send(browser)
  caps.platform = config[browser]['platform']
  caps.version = config[browser]['version']

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
