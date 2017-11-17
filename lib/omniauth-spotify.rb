require 'omniauth/strategies/oauth2'
require 'date'

module OmniAuth
  module Strategies
    class Quip < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'quip'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, site:          'https://platform.quip.com/1',
                              authorize_url: 'https://platform.quip.com/1/oauth/login',
                              token_url:     'https://platform.quip.com/1/oauth/access_token'

      option :authorize_options, %i[grant_type]

      uid { raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          # Only lists emails for 
          email: (raw_info['emails'] || {})[0]
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('users/current').parsed
      end

      def callback_url
        # Fixes regression in omniauth-oauth2 v1.4.0
        # See: https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
        options[:callback_url] || (full_host + script_name + callback_path)
      end
    end
  end
end
