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
  link(:all_comments, :link_text => /All comments/)
  link(:back_to_yesno, :link_text => "Back to step 1")
  span(:create_account, :text => 'Create an account')
  link(:feedback_page, :link_text => 'feedback page')
  link(:float_tip, :link_text => "What's this?")
  link(:helpful_feedback, :href => 'http://en.wikipedia.org/wiki/Wikipedia:Feedback_guidelines', :link_text => 'helpful feedback')
  text_area(:input_area, :id => 'articleFeedbackv5-find-feedback')
  link(:learn_more, :link_text => /Learn more/)
  link(:log_in, :link_text => 'Log in')
  link(:most_relevant, :link_text => /Most relevant/)
  span(:no_span, :text => "No")
  span(:post_feedback, :text => 'Post your feedback')
  select_list(:sort_by, :id => 'articleFeedbackv5-sort-select')
  link(:terms, :href => '//wikimediafoundation.org/wiki/Feedback_privacy_statement', :link_text => 'terms')
  link(:view_article, :link_text => 'View article')
  span(:yes_span, :text => "Yes")
end
