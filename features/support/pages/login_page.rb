class LoginPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UserLogin")
  end
  page_url url

  div(:feedback, class: "errorbox")
  button(:login, :id => 'wpLoginAttempt')
  text_field(:password, :id => 'wpPassword1')
  link(:phishing, :link_text => "phishing")
  link(:password_strength, :link_text => "password strength")
  text_field(:username, :id => 'wpName1')

  def logged_in_as_element
    @browser.div(id: "mw-content-text").p.b
  end
  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end


