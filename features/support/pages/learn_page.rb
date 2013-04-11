class LearnPage
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

  checkbox(:skip, id: 'mwe-upwiz-skip')
  div(:next_parent, id: 'mwe-upwiz-stepdiv-tutorial')
  span(:next) do |page|
    page.next_parent_element.span_element(text: 'Next')
  end
end
