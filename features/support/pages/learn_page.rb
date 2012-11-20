class LearnPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  checkbox(:skip, id: 'mwe-upwiz-skip')
  div(:next_parent, id: 'mwe-upwiz-stepdiv-tutorial')
  span(:next) do |page|
    page.next_parent_element.span_element(text: "Next")
  end
end
