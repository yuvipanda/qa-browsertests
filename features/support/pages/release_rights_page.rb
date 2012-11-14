class ReleaseRightsPage
  include PageObject

  def self.url
    if ENV['BASE_URL']
      base_url = ENV['BASE_URL']
    else
      base_url = "test2"
    end

    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][base_url]}Special:UploadWizard"
  end
  page_url url

  div(:next_parent, id: "mwe-upwiz-stepdiv-deeds")
  span(:next) do |page|
    page.next_parent_element.span(text: 'Next')
  end
end
