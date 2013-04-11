class RandomPage
  include PageObject

  def self.url
    if ENV['MEDIAWIKI_URL']
      mediawiki_url = ENV['MEDIAWIKI_URL']
    else
      mediawiki_url = 'http://en.wikipedia.beta.wmflabs.org/wiki/'
    end
    "#{mediawiki_url}Special:Random"
  end
  page_url url

  li(:main_page, id: 'n-mainpage-description')
  a(:uls_trigger, class: 'uls-trigger')
  div(:search, id: 'search')

  text_field(:search_input, id: 'searchInput')
  button(:search_button, id: 'searchButton')
end
