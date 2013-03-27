# encoding: utf-8
class PtWikivoyageMainPage
  include PageObject

  def self.url
    'http://pt.wikivoyage.org/wiki/P%C3%A1gina_principal'
  end
  page_url url

  expected_title 'África - Wikivoyage'
  text_field(:search, id: 'searchInput')
  button(:searchbutton, id: 'searchButton')
end
