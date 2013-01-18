class EditPage
  include PageObject

  a(:advanced, text: 'Advanced')
  text_area(:article_text, id: 'wpTextbox1')
  a(:bold, text: 'Bold')
  a(:embedded, text: 'Embedded file')
  a(:italic, text: 'Italic')
  a(:link, text: 'Link')
  button(:preview, id: 'wpPreview')
  a(:read, text: 'Read')
  a(:reference, text: 'Reference')
  button(:save, id: 'wpSave')
  a(:sig, text: 'Signature and timestamp')
  button(:show_changes, id: 'wpDiff')
  a(:special, text: 'Special characters')
  a(:view_history, text: 'View history')
end
