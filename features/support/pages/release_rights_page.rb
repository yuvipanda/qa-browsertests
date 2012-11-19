class ReleaseRightsPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url("Special:UploadWizard")
  end
  page_url url

  div(:next_parent, id: "mwe-upwiz-stepdiv-deeds")
  span(:next) do |page|
    page.next_parent_element.span(text: 'Next')
  end
end
