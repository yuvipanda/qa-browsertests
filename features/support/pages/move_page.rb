class MovePage
  include PageObject

  select(:namespace, id: 'wpNewTitleNs')
  text_field(:new_title, id: 'wpNewTitleMain')
  text_field(:reason, id: 'wpReason')
  checkbox(:leave_redirect, id: 'wpLeaveRedirect')
  checkbox(:watch_source, id: 'watch')
end
