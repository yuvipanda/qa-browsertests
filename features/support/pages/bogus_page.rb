class BogusPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Bogus_page")
  end
  page_url url

  a(:search_for_page, text: 'search for Bogus page in Wikipedia')
end
