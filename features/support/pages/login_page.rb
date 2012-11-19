class LoginPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UserLogin")
  end
  page_url url

  text_field(:username, :id => 'wpName1')
  text_field(:password, :id => 'wpPassword1')
  button(:login, :id => 'wpLoginAttempt')
  link(:phishing, :link_text => "phishing")
  link(:password_strength, :link_text => "password strength")
  div(:feedback, class: "errorbox")

  def logged_in_as_element
    @browser.div(id: "mw-content-text").p.b
  end

  def login_with(username, password)
    self.username = username
    self.password = password
    login
  end
end


