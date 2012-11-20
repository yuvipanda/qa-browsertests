class AftV5Page
  include PageObject
  #THIS TEST SHOULD RUN ONLY ON BETA LABS UNTIL AFTV5 IS 100% ENABLED ON TEST2/PROD
  def self.url
    base_url = "wmflabs"

    config = YAML.load_file('config/config.yml')
    "#{config['base_url'][base_url]}Aftpage"
  end
  page_url url
  div(:aft_box, :id => 'mw-articlefeedbackv5')
  link(:float_tip, :link_text => "What's this?")
  span(:yes_span, :text => "Yes")
  span(:no_span, :text => "No")
  link(:back_to_yesno, :link_text => "Back to step 1")
  link(:terms, :href => '//wikimediafoundation.org/wiki/Feedback_privacy_statement', :link_text => 'terms')
  link(:helpful_feedback, :href => 'http://en.wikipedia.org/wiki/Wikipedia:Feedback_guidelines', :link_text => 'helpful feedback')
  text_area(:input_area, :id => 'articleFeedbackv5-find-feedback')
  span(:post_feedback, :text => 'Post your feedback')
  link(:feedback_page, :link_text => 'feedback page')
  span(:create_account, :text => 'Create an account')
  link(:log_in, :link_text => 'Log in')
  link(:all_comments, :link_text => /All comments/)
  link(:most_relevant, :link_text => /Most relevant/)
  select_list(:sort_by, :id => 'articleFeedbackv5-sort-select')
  link(:view_article, :link_text => 'View article')
  link(:learn_more, :link_text => /Learn more/)
end
