class TourPage
  include PageObject

  div(:guider1, id: 'gt-gettingstarted-1')
  div(:guider2, id: 'gt-gettingstarted-2')
  div(:guider3, id: 'gt-gettingstarted-3')
  div(:guider4, id: 'gt-gettingstarted-4')
  a(:edit, text: 'Edit')
  a(:okay, text: 'Okay')
  button(:preview, id: 'wpPreview')
end
