# Jenkins setup

- Jenkins > Manage Jenkins > Manage Plugins > Configure System > CloudBees DEV@cloud Authorization > CloudBees Public Key
- https://github.com/settings/ssh > Add SSH key > CloudBees Public Key

- Jenkins > Manage Jenkins > Manage Plugins > Available > ChuckNorris Plugin, Jenkins GIT plugin, Green Balls
- Jenkins > New Job
  - Job name: wmf
  - Build a free-style software project
  - OK
- Jenkins > Job > Configure
  - Project name: wmf
  - Source Code Management > Git > Repositories > Repository URL: git@github.com:zeljkofilipin/Page-Object-WMF-spike.git
  - Build > Add build step > Execute shell:

--

    curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/use-ruby
    RUBY_VERSION=1.9.3-p194 \
      source ./use-ruby

    gem install bundler --no-ri --no-rdoc
    bundle install
    bundle exec rspec spec/bogus_page_spec.rb:5
--


