class RandomPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('Special:Random')
  end
  page_url url
end
