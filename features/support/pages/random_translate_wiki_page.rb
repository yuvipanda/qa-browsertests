class RandomTranslateWikiPage
  include PageObject

  def self.url
    'http://sandbox.translatewiki.net/wiki/Special:Random'
  end
  page_url url

  li(:main_page, id: 'n-mainpage-description')
  a(:uls_trigger, class: 'uls-trigger')
  div(:search, id: 'search')
end
