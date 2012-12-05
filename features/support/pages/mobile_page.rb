class MobilePage
  include PageObject

  def self.url
    base_url = "wikipediam"

    config = YAML.load_file('config/config.yml')
    config['base_url'][base_url]
  end
  page_url url

  text_field(:search_box, :id => 'mw-mf-search')
  a(:watch_link, :class => 'watch-this-article')
  a(:watched_link, :class => 'watch-this-article watched')
end
