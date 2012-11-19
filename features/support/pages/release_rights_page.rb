class ReleaseRightsPage
  include PageObject
  include URLModule

  def self.url
    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][URLModule.base_url]}Special:UploadWizard"
  end
  page_url url

  div(:next_parent, id: "mwe-upwiz-stepdiv-deeds")
  span(:next) do |page|
    page.next_parent_element.span(text: 'Next')
  end
end
