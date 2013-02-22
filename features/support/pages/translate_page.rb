class TranslatePage
  include PageObject
  include URLModule

  def self.url
    'https://translatewiki.net/wiki/Special:Translate'
  end
  page_url url

  a(:proofread, text: 'Proofread')
  
end

