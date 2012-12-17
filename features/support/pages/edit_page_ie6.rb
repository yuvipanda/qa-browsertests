class EditPageIE6
  include PageObject

  img(:bold, id: 'mw-editbutton-bold')
  img(:embedded, id: 'mw-editbutton-image')
  img(:italic, id: 'mw-editbutton-italic')
  img(:link, id: 'mw-editbutton-link')
  img(:sig, id: 'mw-editbutton-signature')
end
