class RandomTranslateWikiPage
  include PageObject

  def self.url
    'http://sandbox.translatewiki.net/wiki/Special:Random'
  end
  page_url url

  li(:main_page, id: 'n-mainpage-description')
end
