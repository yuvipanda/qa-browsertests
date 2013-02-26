class CreateAccountPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('Special:CreateAccount')
  end
  page_url url

  button(:create_account, id: 'wpCreateaccount')

end
