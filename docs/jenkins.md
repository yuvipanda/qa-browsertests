# Jenkins setup

## Git

- Jenkins > Manage Jenkins > Configure System

or

- Jenkins > (job) > Configure
  - CloudBees DEV@cloud Authorization > CloudBees Public Key > copy
- https://gerrit.wikimedia.org/r/#/settings/ssh-keys > Add Key ... > paste > Add

## Plugins

- Jenkins > Manage Jenkins > Manage Plugins > Available > ChuckNorris Plugin, Green Balls

# Job

- Jenkins > New Job
  - Job name: (name)
  - Build multi-configuration project
  - OK
- Jenkins > Job > Configure
  - Project name: (name)
  - Source Code Management > Git > Repositories > Repository URL: ssh://zfilipin@gerrit.wikimedia.org:29418/qa/browsertests.git
  - Build Triggers > Build periodically	> Schedule: 0 20,23 * * *
  - Configuration Matrix > Add axis > User-defined Axis
    - Name: BROWSER_LABEL
    - Values:

--

    chrome
    firefox
    internet_explorer_6
    internet_explorer_7
    internet_explorer_8
    internet_explorer_9
    internet_explorer_10

--

  - Build > Add build step > Execute shell:

--

    export BASE_URL=test2
    export ENVIRONMENT=cloudbees

    curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/ruby/use-ruby
    RUBY_VERSION=1.9.3-p327 \
      source ./use-ruby

    gem install bundler --no-ri --no-rdoc
    bundle install
    bundle exec rake

--

  - Post-build Actions > Add post-build action
    - Publish JUnit test result report > Test report XMLs: reports/junit/*.xml
    - E-mail Notification > Recipients: zfilipin cmcmahon at wikimedia
