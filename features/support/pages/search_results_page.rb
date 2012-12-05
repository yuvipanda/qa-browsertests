class SearchResultsPage
  include PageObject

  text_field(:search, id: "searchText")
  h1(:title, id: "firstHeading")
end
