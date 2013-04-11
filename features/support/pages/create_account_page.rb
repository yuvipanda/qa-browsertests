class CreateAccountPage
  include PageObject

  def self.url
    if ENV['MEDIAWIKI_URL']
      mediawiki_url = ENV['MEDIAWIKI_URL']
    else
      mediawiki_url = 'http://en.wikipedia.beta.wmflabs.org/wiki/'
    end
    "#{mediawiki_url}<%=params[:page_title]%>"
  end
  page_url url

  button(:create_account, id: 'wpCreateaccount')
end
