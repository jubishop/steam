require 'http'

require 'core'
require 'duration'
require 'datacache'

require_relative 'exceptions'

module Steam
  class API
    def initialize(token = ENV['STEAM_TOKEN'])
      @token = token
      raise ArgumentError, 'Steam::API needs a token' unless @token
    end

    @@player_summary_cache = DataCache.new(1.hour)
    def player_summary(id)
      return @@player_summary_cache.fetch(id) {
        data = request('ISteamUser/GetPlayerSummaries/v0002', {
          key: @token,
          steamids: id
        })
        return data[:response][:players].first
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

        data = response.parse
      rescue HTTP::Error
        raise Steam::Error, uri
      end

      return data.deep_symbolize_keys!
    end
  end
end
