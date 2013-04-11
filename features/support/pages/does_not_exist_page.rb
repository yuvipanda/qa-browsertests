class DoesNotExistPage
  include PageObject

  def self.url
    if ENV['MEDIAWIKI_URL']
      mediawiki_url = ENV['MEDIAWIKI_URL']
    else
      mediawiki_url = 'http://en.wikipedia.beta.wmflabs.org/wiki/'
    end
    "#{mediawiki_url}<%=params[:page_name]%>"
  end
  page_url url

  a(:create, text: 'Create')
  div(:page_text, id: 'mw-content-text')
end
