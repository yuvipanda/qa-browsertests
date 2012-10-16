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

def browser(environment)
  if environment == :cloudbees
    sauce_browser
  else
    local_browser
  end
end
def environment(folder)
  if folder.match Regexp.escape("/scratch/jenkins/workspace/")
    :cloudbees
  else
    :local
  end
end
def local_browser
  Watir::Browser.new :firefox
end
def sauce_browser
  caps = Selenium::WebDriver::Remote::Capabilities.firefox
  caps.platform = 'Linux'
  caps.version = '15'

  secret = YAML.load_file('config/secret.yml')
  Watir::Browser.new(
    :remote,
    :url => "http://#{secret['username']}:#{secret['key']}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
end

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before(:all) do
    folder = Dir.pwd
    @browser = browser(environment(folder))
  end

  config.after(:all) do
    @browser.close
  end
end
