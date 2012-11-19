class AftV5Page
  include PageObject

  def self.url
    base_url = "wmflabs"

    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][base_url]}Special:Random"
  end
  page_url url

  div(:aft_box, id: 'mw-articlefeedbackv5')
  a(:all_comments, text: /All comments/)
  a(:back_to_yesno, text: 'Back to step 1')
  a(:feedback_page, text: 'feedback page')
  a(:float_tip, text: "What's this?")
  a(:helpful_feedback, href: 'http://en.wikipedia.org/wiki/Wikipedia:Feedback_guidelines', text: 'helpful feedback')
  a(:learn_more, text: /Learn more/)
  a(:most_relevant, text: /Most relevant/)
  radio(:no_button, id: 'articleFeedbackv5-bucket6-toggle-no')
  button(:post_feedback, id: 'articleFeedbackv5-submit-btn')
  select(:sort_by, id: 'articleFeedbackv5-sort-select')
  a(:terms, href: '//wikimediafoundation.org/wiki/Feedback_privacy_statement', text: 'terms')
  a(:view_article, text: 'View article')
  radio(:yes_button, id: 'articleFeedbackv5-bucket6-toggle-yes')
end
