# before all
require "bundler/setup"
require "page-object"
require "page-object/page_factory"
require "require_all"
require "watir-webdriver"
require "yaml"

World(PageObject::PageFactory)

def browser(environment, test_name)
  if environment == :cloudbees
    sauce_browser(test_name)
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
def sauce_browser(test_name)
  config = YAML.load_file('config/config.yml')
  browser_label = config[ENV['BROWSER_LABEL']]

  caps = Selenium::WebDriver::Remote::Capabilities.send(browser_label['name'])
  caps.platform = browser_label['platform']
  caps.version = browser_label['version']
  caps[:name] = "#{test_name} #{ENV['JOB_NAME']}##{ENV['BUILD_NUMBER']}"

  browser = Watir::Browser.new(
    :remote,
    :url => "http://#{SECRET['username']}:#{SECRET['key']}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)

  browser.wd.file_detector = lambda do |args|
    # args => ["/path/to/file"]
    str = args.first.to_s
    str if File.exist?(str)
  end

  browser
end
def test_name(scenario)
  if scenario.respond_to? :feature
    "#{scenario.feature.name}: #{scenario.name}"
  elsif scenario.respond_to? :scenario_outline
    "#{scenario.scenario_outline.feature.name}: #{scenario.scenario_outline.name}: #{scenario.name}"
  end
end

config = YAML.load_file('config/config.yml')
username = config['test2_username']

SECRET = YAML.load_file('config/secret.yml')
password = SECRET['test2_password']

Before do |scenario|
  @username = username
  @password = password
  @browser = browser(environment, test_name(scenario))
  $session_id = @browser.driver.instance_variable_get(:@bridge).session_id
end

After do |scenario|
  %x{curl -H "Content-Type:text/json" -s -X PUT -d '{"passed": #{scenario.passed?}}' http://#{SECRET['username']}:#{SECRET['key']}@saucelabs.com/rest/v1/#{SECRET['username']}/jobs/#{$session_id}} if environment == :cloudbees
  @browser.close
end
