# before all
require "bundler/setup"
require "page-object"
require "page-object/page_factory"
require "require_all"
require "watir-webdriver"
require "yaml"

World(PageObject::PageFactory)

SECRET = YAML.load_file('config/secret.yml')

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

  Watir::Browser.new(
    :remote,
    :url => "http://#{SECRET['username']}:#{SECRET['key']}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)
end

Before do |scenario|
  @browser = browser(environment)
end

After do |scenario|
  if environment == :cloudbees
    session_id = @browser.driver.instance_variable_get(:@bridge).session_id
    %x{curl -H "Content-Type:text/json" -s -X PUT -d '{"passed": #{scenario.passed?}}' http://#{SECRET['username']}:#{SECRET['key']}@saucelabs.com/rest/v1/#{SECRET['username']}/jobs/#{session_id}}
  end
  @browser.close
end
