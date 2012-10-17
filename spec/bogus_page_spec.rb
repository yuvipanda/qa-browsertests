require 'spec_helper'

describe "article does not exist" do
  it "there should be text that article does not exist" do
    visit_page(BogusPage) do |page|
      page.text.should include "Wikipedia does not have an article with this exact name."
    end
  end
  it "'search for page' link should open search results page" do
    visit_page(BogusPage).search_for_page
    on(SearchResultsPage) do |page|
      page.title.should == "Search results"
      page.search.should == "Bogus page"
    end
  end
end
