class DoesNotExistPage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('<%=params[:page_name]%>')
  end
  page_url url

  a(:create, text: 'Create')
  div(:page_text, id: 'mw-content-text')
end
