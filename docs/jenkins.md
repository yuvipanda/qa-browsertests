# Jenkins

## Plugins

- Jenkins > Manage Jenkins > Manage Plugins > Available > ChuckNorris Plugin, Green Balls, Jenkins instant-messaging plugin, Jenkins IRC Plugin

## Git

- Jenkins > Manage Jenkins > Configure System

or

- Jenkins > (job) > Configure
  - CloudBees DEV@cloud Authorization > CloudBees Public Key > copy
- https://gerrit.wikimedia.org/r/#/settings/ssh-keys > Add Key ... > paste > Add

# IRC Notification

- Enable IRC Notification > check
- Hostname: irc.freenode.net
- Port: 6667
- Channels
  - Name: #wikimedia-mobile
  - Notification only: check
- Advanced...
  - Nickname: wmf-selenium-bot
  - Login: wmf-selenium-bot
  - nickname and login have to be the same
