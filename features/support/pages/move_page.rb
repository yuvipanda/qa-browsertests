class MovePage
  include PageObject

  select(:namespace, id: 'wpNewTitleNs')
  text_field(:new_title, id: 'wpNewTitleMain')
  text_field(:reason, id: 'wpReason')
  checkbox(:leave_redirect, id: 'wpLeaveRedirect')
  checkbox(:watch_source, id: 'watch')
  button(:move_page, name: 'wpMove')

  def old_page_link_element(text)
    @browser.a(text: text)
  end
  def moved_page_link_element(text)
    @browser.a(text: "#{text} Moved")
  end
end
