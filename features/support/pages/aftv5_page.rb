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
  a(:all_comments, :text => /All comments/)
  a(:back_to_yesno, :text => "Back to step 1")
  span(:create_account, :text => 'Create an account')
  a(:feedback_page, :text => 'feedback page')
  a(:float_tip, :text => "What's this?")
  a(:helpful_feedback, :href => 'http://en.wikipedia.org/wiki/Wikipedia:Feedback_guidelines', :text => 'helpful feedback')
  text_area(:input_area, :id => 'articleFeedbackv5-find-feedback')
  a(:learn_more, :text => /Learn more/)
  a(:log_in, :text => 'Log in')
  a(:most_relevant, :text => /Most relevant/)
  span(:no_span, :text => "No")
  span(:post_feedback, :text => 'Post your feedback')
  select(:sort_by, :id => 'articleFeedbackv5-sort-select')
  a(:terms, :href => '//wikimediafoundation.org/wiki/Feedback_privacy_statement', :text => 'terms')
  a(:view_article, :text => 'View article')
  span(:yes_span, :text => "Yes")
end
