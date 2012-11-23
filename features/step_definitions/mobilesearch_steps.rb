Given /^I am on the Mobile website$/ do
  visit(MobilePage) do |page|
    page.text.should include "Today's featured article"
  end
end

When /^I type three known characters$/ do
  on(MobilePage) do |page|
    page.search_box_element.should be_true
    page.search_box="san"
  end
end

Then /^Search results matching my characters appear$/ do
  on(MobilePage) do |page|
    page.wait_until(10) do
      page.text.include? "San Francisco"
    end
  end
end

#WATCHLIST LINK APPEARS FOR CHROME BUT NOT FOR FIREFOX, BUGZILLA TICKET TBD

#And /^There is a a watchlist link on the page$/ do
#  on(MobilePage) do |page|
#    page.watch_link_element.should be_true
#  end
#end

#And /^When the watchlist link is clicked it becomes watched$/ do
#  on(MobilePage) do |arg|
#    @page = arg
#    @page.watch_link
#    @page.wait_until(10) do
#      @page.watched_link_element.exists?
#    end
#  end
#end
