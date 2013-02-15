class TourPage
  include PageObject

  div(:guider1, id: 'gt-gettingstarted-1')
  div(:guider2, id: 'gt-gettingstarted-2')
  div(:guider3, id: 'gt-gettingstarted-3')
  a(:edit, text: 'Edit')
  a(:okay, text: 'Okay')
end
