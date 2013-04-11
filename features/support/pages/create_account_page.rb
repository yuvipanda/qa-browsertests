class CreateAccountPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('')
  end
  page_url "#{url}<%=params[:page_title]%>"

  button(:create_account, id: 'wpCreateaccount')
end
