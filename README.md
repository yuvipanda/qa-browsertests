# Browser testing at WMF

## Environment

File with credentials should be located at `/private/wmf/secret.yml`.

To run the Selenium tests you will have to install Ruby (for the exact version see .rvmrc), the latest versions of RubyGems and Firefox. The easiest way to install Ruby on *nix is RVM (https://rvm.io/) and on Windows RubyInstaller (http://rubyinstaller.org/).

Update RubyGems and install required RubyGems:

    gem update --system
    gem install bundler
    bundle install

Run the tests with `bundle exec rake`.

HTML report is created at reports/ and XML report (for Jenkins) is created at reports/junit.

## Sites

Code is pushed to https://gerrit.wikimedia.org/r/gitweb?p=qa/browsertests.git;a=summary

GitHub mirror is at https://github.com/wikimedia/qa-browsertests

Mobile tests are in `tests/acceptance` folder of [MobileFrontend](https://github.com/wikimedia/mediawiki-extensions-MobileFrontend) extension.

Jenkins is hosted at https://wmf.ci.cloudbees.com/

Tests are running at http://saucelabs.com/

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/wikimedia/qa-browsertests)
