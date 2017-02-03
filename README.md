# iExpedition

## Getting Started

After you have cloned this repo, make sure you have been added as a collaborator to the heroku iExpedition project, you have the heroku toolbelt installed and then log into heroku via command line:

    % heroku login

Install Postgres.app here: http://postgresapp.com/

Make sure you have rbenv or rvm installed and are using ruby 2.4.0. We are using rails 5.0.1

Then run this setup script to set up your machine with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

Alternatively for a more simple setup, just make sure you are running a postgres server on your machine and you have heroku toolbelt installed.

After setting up, make sure you have a dotenv file in project root and run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style I](https://github.com/bbatsov/rubocop)
Rubocop configuation at [.rubocop.yml](.rubocop.yml)

We follow the following naming convention for branches:
`[group]/[name]`

Where `group` will be one of these five groupings:
```
wip       Works in progress; stuff I know won't be finished soon
feat      Feature I'm adding or expanding
bug       Bug fix or experiment
cleanup   General code cleanup
junk      Throwaway branch created to experiment
```
and `name` will be a `brief-description` separated by dashes (-). On rare occasion other `group`'s may be defined.

Contributions will be based on the following five step workflow:
```
1. Create branch
2. Rebase from {master}
3. PR
4. (after PR approved) Rebase from {master} (this time squashing down to single commit)
5. Rebase onto {master}
```
This ensures a comprehensible linear commit history.


We follow the following message convention for git commit messages:
`[type] [message]`
Where `type` will be one of these four groupings:
```
CLEANUP
FEATURE
BUG
PATCH
STYLE
```
and `message` will be a regular <80 char commit message. If you need more space use git description. This should also be where squashed commit messages will go, if appropriate. On rare occasion other `type`'s may be defined.

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

