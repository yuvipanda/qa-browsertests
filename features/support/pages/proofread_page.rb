# encoding: utf-8

class ProofreadPage
  include PageObject

  page_url 'https://en.wikisource.org/w/index.php?title=Page:United_States_Statutes_at_Large_Volume_43_Part_2.djvu/153'

  a(:edit, text: 'Edit')
  #after clicking Edit
  text_area(:article_text, id: 'wpTextbox1')
  a(:bold, title: 'Bold')
  a(:italic, title: 'Italic')
  a(:embedded, title: 'Embedded file')
  a(:signature, title: 'Signature and timestamp')
  span(:link_page, title: 'Link')
  span(:reference, title: 'Reference')
  img(:ocr, id: 'wsOcr1')

  #collapsible links display additional features
  a(:advanced, text: 'Advanced')
  div(:advanced_toolbar, class: 'section-advanced')
  a(:level2, text: 'Level 2')
  a(:level2, text: 'Level 3')
  a(:level2, text: 'Level 4')
  a(:level2, text: 'Level 5')
  span(:bulleted, title: 'Bulleted list')
  span(:numbered, title: 'Numbered list')
  span(:indent, title: 'Indentation')
  span(:nowiki, title: 'No wiki formatting')
  span(:newline, title: 'New line')
  span(:big, title: 'Big')
  span(:small, title: 'Small')
  span(:superscript, title: 'Superscript')
  span(:subscript, title: 'Subscript')
  span(:gallery, title: 'Picture gallery')
  span(:redirect, title: 'Redirect')
  span(:table, title: 'Table')

  #define the first 3 char sets and the first char in each
  a(:special, text: 'Special characters')
  div(:latin, text: 'Latin')
  span(:latin_a, text: 'Á')
  div(:latin_extended, text: 'Latin extended')
  span(:latin_extended_a, text: 'Ḁ')
  div(:ipa, text: 'IPA')
  span(:ipa_p, text: 'p')

  #define the first 3 help links
  a(:help, text: 'Help')
  a(:formatting, text: 'Formatting')
  a(:links_help, text: 'Links')
  a(:headings, text: 'Headings')

  a(:proofread, text: 'Proofread tools')
  img(:zoom_in, title: 'Zoom in')
  img(:zoom_out, title: 'Zoom out')
  img(:original_size, title: 'Original size')
  #img(:show_hide, title,: "Show/hide this page's header and footer")
  img(:vertical_horizontal, title: 'Vertical/horizontal layout')
end
