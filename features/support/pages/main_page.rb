class MainPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('Main_Page')
  end
  page_url url

  a(:my_sandbox, text: "My sandbox")
end
