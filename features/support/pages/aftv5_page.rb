class AftV5Page
  include PageObject

  def self.url
    base_url = "wmflabs"

    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][base_url]}Special:Random"
  end
  page_url url

  div(:aft_box, :id => 'mw-articlefeedbackv5')
  link(:all_comments, :link_text => /All comments/)
  link(:back_to_yesno, :link_text => "Back to step 1")
  link(:feedback_page, :link_text => 'feedback page')
  link(:float_tip, :link_text => "What's this?")
  link(:helpful_feedback, :href => 'http://en.wikipedia.org/wiki/Wikipedia:Feedback_guidelines', :link_text => 'helpful feedback')
  link(:learn_more, :link_text => /Learn more/)
  link(:most_relevant, :link_text => /Most relevant/)
  radio_button(:no_button, :id => 'articleFeedbackv5-bucket6-toggle-no')
  button(:post_feedback, :id => 'articleFeedbackv5-submit-btn')
  select_list(:sort_by, :id => 'articleFeedbackv5-sort-select')
  link(:terms, :href => '//wikimediafoundation.org/wiki/Feedback_privacy_statement', :link_text => 'terms')
  link(:view_article, :link_text => 'View article')
  radio_button(:yes_button, :id => 'articleFeedbackv5-bucket6-toggle-yes')

  # ANONS GET CREATE AN ACCOUNT/LOGIN CTA HERE
  # FOLLOWING feedback_page LINK GOES TO AFT FOR THE RANDOM ARTICLE
end
