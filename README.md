# Actionmap

<div style="text-align: center;">

Actionmap is an app that allows users to learn more about their representatives,
political events in their area as well as aggregate, share and view news items in their locality.

</div>

<!-- TODO: Update these for your repo! -->

[![All Specs](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml/badge.svg)](https://github.com/saasbook/hw-agile-iterations/actions/workflows/specs.yml)

[![codecov](https://codecov.io/gh/saasbook/hw-agile-iterations/branch/master/graph/badge.svg?token=SGYCvQX4Us)](https://codecov.io/gh/saasbook/hw-agile-iterations)

### Getting Setup Locally

Follow the [Getting Started Guide](./docs/01-getting-started.md) to get your localhost environment setup.
# ActionMap-Political-Map

<div style="text-align: left;">

You will need to run this in every terminal where you're using node.
> nvm use 13

You need to run database migrations in db/migrate to prepare your local database to store and serve data, and add the seed data to it:
> bundle exec rails db:migrate

> bundle exec rails db:seed

Regarding credentials management, you can edit the credentials.yml file with the following command: 

> EDITOR=vim bundle exec rails credentials:edit

The credentials.yml file should look like the following:
> \# aws:
>
> \# access key_id: 123
>
> \# secret_access_key: 345
>
> production:
>
>        GOOGLE_CLIENT_ID: <id>.apps.googleusercontent.com
>
>        GOOGLE_CLIENT_SECRET: <secret>
>
>        GOOGLE_API_KEY: <key>
>
>        GITHUB_CLIENT_ID: <id>
>
>        GITHUB CLIENT SECRET: <key>
>
> development:
>
>        GOOGLE_CLIENT_ID: <id>
>
>        GOOGLE_CLIENT_SECRET: <secret>  
>
>        GOOGLE_API_KEY: <key>
>
>        GITHUB_CLIENT_ID: <id>
>
>	GITHUB_CLIENT_SECRET: <secret>
>
> \# Used as the base secret for all MessageVerifiers in Rails, including the one protecting cookies.
> secret_key_base: <secret>

GitHub does not version the master key. To use the current version, use the existing credentials.yml.enc and create master.key in the config directory with the following value: 

> a9d421bbdb9dede5b22e245396349907

To verify the current encrypted credentials, config/credentials.yml.enc should start with “uA4Knd” and end with “8ze16g==“. 

To deploy to Heroku, add the contents of the master,key value as a Git secret and a Heroku secret as RAILS_MASTER_KEY. 

Here's how to launch locally after installing the gem dependencies and doing the above set-up:

1. Open 2 Terminal windows or tabs. In one, run:
> bin/webpack-dev-server
2. In the other Terminal window, run: 
> bundle exec rails server -b 0.0.0.0

</div>