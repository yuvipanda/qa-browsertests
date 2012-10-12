class BogusPage
  include PageObject

  #http://en.wikipedia.beta.wmflabs.org/wiki/Bogus_page
  page_url 'https://en.wikipedia.org/wiki/Bogus_page'

  a(:search_for_page, :text => 'search for Bogus page in Wikipedia')
  a(:search2, :text => 'Search for "Bogus page"')
end
