# Browser testing at WMF

## Environment

File with credentials should be located at `/private/wmf/secret.yml`.

- Firefox 16
- Ruby 1.9.3p327
  - RubyGems 1.8.24

Install required RubyGems:

    gem update --system
    gem install bundler
    bundle install

Run the tests with `bundle exec rake`.

## Sites

Code is pushed to https://gerrit.wikimedia.org/r/gitweb?p=qa/browsertests.git;a=summary

GitHub mirror is at https://github.com/wikimedia/qa-browsertests

Jenkins is hosted at https://wmf.ci.cloudbees.com/

Tests are running at http://saucelabs.com/
