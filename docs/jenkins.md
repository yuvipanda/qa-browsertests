# Jenkins setup

## GitHub

- Jenkins > Manage Jenkins > Manage Plugins > Configure System > CloudBees DEV@cloud Authorization > CloudBees Public Key > copy
- https://gerrit.wikimedia.org/r/#/settings/ssh-keys > Add Key ... > CloudBees Public Key > paste > Add

## Plugins

- Jenkins > Manage Jenkins > Manage Plugins > Available > ChuckNorris Plugin, Jenkins GIT plugin, Green Balls

# Job

- Jenkins > New Job
  - Job name: (name)
  - Build a free-style software project
  - OK
- Jenkins > Job > Configure
  - Project name: (name)
  - Source Code Management > Git > Repositories > Repository URL: ssh://zfilipin@gerrit.wikimedia.org:29418/qa/browsertests.git
  - Build > Add build step > Execute shell:

--

    # for the list of supported browsers see config/config.yml
    export BROWSER_NAME=(browser)
    export ENVIRONMENT=cloudbees

    curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/use-ruby
    RUBY_VERSION=1.9.3-p194 \
      source ./use-ruby

    gem install bundler --no-ri --no-rdoc
    bundle install
    bundle exec rake

--

  - Post-build Actions > Add post-build action > Publish JUnit test result report > Test report XMLs: spec/reports/*.xml
