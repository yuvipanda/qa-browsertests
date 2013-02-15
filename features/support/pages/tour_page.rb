class TourPage
  include PageObject

  div(:guider1, id: 'gt-gettingstarted-1')
  div(:guider2, id: 'gt-gettingstarted-2')
  a(:okay, text: 'Okay')
end
