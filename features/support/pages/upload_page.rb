class UploadPage
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

  span(:continue, text: 'Continue')
  file_field(:select_file, name: 'file')
end
