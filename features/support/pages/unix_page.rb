class UnixPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('Unix')
  end
  page_url url

  a(:edit, text: 'Edit')
end
