class ArticlePage
  include PageObject
  include URLModule

  def self.url
    URLModule.url('<%=params[:page_name]%>')
  end
  page_url url

  a(:discussion, text: 'Discussion')
  a(:edit, text: 'Edit')
  div(:page_text, id: 'mw-content-text')
  h1(:title, id: 'firstHeading')
  a(:watchlist, text: 'Unwatch')
  a(:move_link, text: 'Move')
  div(:actions, id: 'p-cactions')
  a(:actions_link) do |page|
    page.actions_element.a
  end
  select(:namespace, id: 'wpNewTitleNs')
end
