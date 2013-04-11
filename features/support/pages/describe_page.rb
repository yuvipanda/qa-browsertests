class DescribePage
  include PageObject

  def self.url
    if ENV['MEDIAWIKI_URL']
      mediawiki_url = ENV['MEDIAWIKI_URL']
    else
      mediawiki_url = 'http://en.wikipedia.beta.wmflabs.org/wiki/'
    end
    "#{mediawiki_url}Special:UploadWizard"
  end
  page_url url

  textarea(:description, name: /^description/)
  div(:next_parent, id: 'mwe-upwiz-stepdiv-details')
  span(:next) do |page|
    page.next_parent_element.span_element(text: 'Next')
  end
  text_field(:title, id: 'title0')
end
