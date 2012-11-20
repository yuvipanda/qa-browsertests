class DescribePage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  textarea(:description, name: /^description/)
  div(:next_parent, id: 'mwe-upwiz-stepdiv-details')
  span(:next) do |page|
    page.next_parent_element.span_element(text: "Next")
  end
  text_field(:title, id: "title0")
end
