class LoginPage
  include PageObject

  if ENV['BASE_URL']
    base_url = ENV['BASE_URL']
  else
    base_url = "test2"
  end

  config = YAML.load_file('config/config.yml')
  page_url "#{config['base_url'][base_url]}Special:UserLogin"

  text_field(:username, :id => 'wpName1')
  text_field(:password, :id => 'wpPassword1')
  button(:login, :id => 'wpLoginAttempt')
  link(:phishing, :link_text => "phishing")
  link(:password_strength, :link_text => "password strength")

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end


