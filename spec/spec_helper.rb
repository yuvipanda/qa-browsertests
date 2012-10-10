$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), ',,', 'lib'))

require 'page-object'
require 'page-object/page_factory'
require 'require_all'
require 'rspec'
require 'rspec/expectations'
require 'watir-webdriver'
require 'yaml'

require_all 'lib/pages'

def sauce_browser
  caps = Selenium::WebDriver::Remote::Capabilities.firefox
  caps.platform = 'Linux'
  caps.version = '15'

  config = YAML.load_file('config/config.yml')
  Watir::Browser.new(
    :remote,
    :url => "http://#{config['username']}:#{config['key']}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
end

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before(:all) do
    @browser = sauce_browser
  end

  config.after(:all) do
    @browser.close
  end
end
