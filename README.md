Apologies for the spam, but I'm using this to test the PR -> Gerrit workflow, since the test repo isn't being replicated :(
Just another silly commit
Testing hooks
The git is dark and full of potential terrors

More spam!
Testing the automatics!

Did I really compile git from source just now?

Hrrmppff

Testing locally

Another commit!
adsfasdf
Yet another silly commit
# Browser testing at WMF

## Environment

To run the Selenium tests you will have to install Ruby (look at `.ruby-version` file for the exact version), the latest versions of RubyGems and Firefox (the default browser in which the tests run). The easiest way to install Ruby on Linux/Unix is [RVM](https://rvm.io/) and on Windows [RubyInstaller](http://rubyinstaller.org/).

Update RubyGems and install the required RubyGems:

    cd browsertests
    gem update --system
    gem install bundler
    bundle install

You will need a file with credentials located at `/private/wmf/secret.yml`. For local testing, create a user named `Selenium_user` on your local wiki and record the password in this file as

    mediawiki_password: password here

Run the tests with `bundle exec rake`, this should start Firefox.
The test run creates an HTML report in `reports/` and an XML report (for Jenkins) in `reports/junit`.

To run a single test enter `bundle exec cucumber features/FEATURE_NAME.feature`.

## Sites

The code repository is https://gerrit.wikimedia.org/r/#/admin/projects/qa/browsertests, the GitHub mirror is at https://github.com/wikimedia/qa-browsertests

The Jenkins instance that orchestrates the tests is hosted at https://wmf.ci.cloudbees.com/

The tests are run in multiple browsers at http://saucelabs.com/

Mobile tests are in the `tests/acceptance` folder of the [MobileFrontend](https://github.com/wikimedia/mediawiki-extensions-MobileFrontend) extension.

Interested? Read more at [How to contribute](http://www.mediawiki.org/wiki/QA/Browser_testing#How_to_contribute) section of Browser testing page.

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/wikimedia/qa-browsertests)
