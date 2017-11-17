# Quip OmniAuth Strategy

This gem provides a simple way to authenticate to the Quip API using OmniAuth with OAuth2.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-quip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-quip

## Usage

You'll need to register an app on Quip, you can do this here - https://rembly.quip.com/api/domain-tokens

Usage of the gem is very similar to other OmniAuth strategies.
You'll need to add your app credentials to `config/initializers/omniauth.rb`:

```ruby
keys = Rails.application.secrets

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :quip, keys.quip['client_id'], keys.quip['client_secret']
end
```

Or with Devise in `config/initializers/devise.rb`:

```ruby
keys = Rails.application.secrets

config.omniauth :quip, keys.quip['client_id'], keys.quip['client_secret']
```

## Auth Hash Schema

The Quip API does not return much data for the user.

* `name`
* `email` - the email is only available if the user is an _admin_, in which case the first email in their list of emails is used

* Info on OAuth integration: https://www.quip.com/dev/automation/documentation#authentication-domain
* Data returned for current user: https://quip.com/dev/automation/documentation#users-get

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
