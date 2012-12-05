require 'spec_helper'

describe 'Edit tools' do
  it 'should display warning message if the page has not been proofread' do
    visit(ProofreadPage).text.should include 'This page has not been proofread'
  end
  context 'on ProofreadPage' do
    before do
      visit(ProofreadPage).edit
      @browser.execute_script('window.onbeforeunload = null')
    end
    it 'should display warning message if the user is not logged in' do
      on(ProofreadPage).text.should include 'Warning: You are not logged in'
    end
    it 'should have editable text' do
      on(ProofreadPage).article_text.should be_true
    end
    it 'should have Bold element' do
      on(ProofreadPage).bold.should be_true
    end
    it 'Bold element should add text to the page' do
      on(ProofreadPage) do |page|
        page.bold_element.click
        page.article_text.should include "'''Bold text'''"
      end
    end
    it 'Italic element should add text to the page' do
      on(ProofreadPage) do |page|
        page.italic_element.click
        page.article_text.should include "''Italic text''"
      end
    end
    it 'Embedded element should add text to the page' do
      on(ProofreadPage) do |page|
        page.embedded_element.click
        page.article_text.should include '[[File:Example.jpg]]'
      end
    end
    it 'Signature and timestamp element should add text to the page' do
      on(ProofreadPage) do |page|
        page.signature_element.click
        page.article_text.should include '--~~~~'
      end
    end
    it 'advanced tools are not visible until Advanced element is clicked' do
      on(ProofreadPage).advanced_toolbar_element.present?.should == false
    end
    it 'advanced tools are visible after clicking Advanced element' do
      on(ProofreadPage) do |page|
        page.advanced
        page.advanced_toolbar_element.present?.should == true
      end
    end
  end #context
end #describe
