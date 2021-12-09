require 'core'
require 'datacache'
require 'duration'
require 'http'

require_relative 'exceptions'

module Steam
  class API
    def initialize(token = ENV['STEAM_TOKEN'])
      @token = token
      raise ArgumentError, 'Steam::API needs a token' unless @token
    end

    def player_summary(id)
      return Private.player_summary_cache.fetch(id) {
        data = request('ISteamUser/GetPlayerSummaries/v0002', {
          key: @token,
          steamids: id
        })
        return data[:response][:players].first
      }
    end

    def resolve_vanity_url(vanity_name)
      return Private.vanity_url_cache.fetch(vanity_name) {
        data = request('ISteamUser/ResolveVanityURL/v0001', {
          key: @token,
          vanityurl: vanity_name
        })
        return data[:response][:steamid]
      }
    end

    private

    def request(path, query)
      uri = HTTP::URI.new(
          scheme: 'https',
          host: 'api.steampowered.com',
          path: path,
          query: HTTP::URI.form_encode(query))
      begin
        response = HTTP.get(uri)
        raise Steam::Error, uri unless response.status.success?

        data = response.parse(:json)
      rescue HTTP::Error
        raise Steam::Error, uri
      end

      return data.deep_symbolize_keys!
    end
  end

  module Private
    @player_summary_cache = DataCache.new(1.hour)
    @vanity_url_cache = DataCache.new(1.hour)
    class << self
      attr_reader :player_summary_cache
      attr_reader :vanity_url_cache
    end
  end
end
