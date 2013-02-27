Given /^I go to Create account page at (.+)$/ do |path|
  visit(CreateAccountPage, :using_params => {:page_title => path})
end

Then /^form has Create account button$/ do
  on(CreateAccountPage).create_account_element.should exist
end

Then /^page has no ResourceLoader errors$/ do
  @browser.execute_script("
return (function() {
    // Returns a string listing problem modules,
    // or empty string if all OK (or not a MediaWiki page).
    // MediaWiki registers many JS modules that are not loaded on average pages.
    var i, len, state,
        modules = mw.loader.getModuleNames(),
        error = [],
        missing = [],
        ret = '';
    if ( ( typeof mediaWiki === 'undefined' ) || !mediaWiki.loader ) {
        return ret;
    }

    for ( i = 0, len = modules.length; i < len; i++ ) {
        state = mw.loader.getState( modules[i] );
        if ( state === 'error' ) {
            error.push( modules[i] );
        }
        if ( state === 'missing' ) {
            missing.push( modules[i] );
        }
    }
    if ( error.length ) {
       ret += 'Error modules: ' + error.join( '; ') + '.';
    }
    if ( missing.length ) {
       ret += 'Missing modules: ' + missing.join( '; ') + '.';
    }
    return ret;
}) ();
").should == ''
end
