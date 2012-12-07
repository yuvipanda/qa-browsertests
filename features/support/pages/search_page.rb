class SearchPage
  include PageObject

  button(:search_button, id: 'searchButton')
  text_field(:search_input, id: 'searchInput')
  div(:search_results, class: 'suggestions-results')
  div(:one_result, class: 'suggestions-result')
end
