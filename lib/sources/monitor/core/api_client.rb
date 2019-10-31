require "rest-client"
require "sources-api-client"

module Sources
  module Monitor
    module Core
      module ApiClient
        ORCHESTRATOR_TENANT = "system_orchestrator".freeze

        def api_client(external_tenant = ORCHESTRATOR_TENANT)
          @sources_api_client ||= SourcesApiClient::ApiClient.new
          @api_client         ||= SourcesApiClient::DefaultApi.new(@sources_api_client)
          @sources_api_client.default_headers.merge!(identity(external_tenant))
          @api_client
        end

        def internal_api_get(collection)
          url = "#{ENV["SOURCES_SCHEME"] || "http"}://#{ENV["SOURCES_HOST"]}:#{ENV["SOURCES_PORT"]}"
          JSON.parse(::RestClient.get("#{url}/internal/v1.0/#{collection}", identity(ORCHESTRATOR_TENANT)))
        rescue ::RestClient::NotFound
          []
        end

        def identity(external_tenant)
          { "x-rh-identity" => Base64.strict_encode64({ "identity" => { "account_number" => external_tenant }}.to_json) }
        end

        PAGED_SIZE = 1000
        def paged_query(client, list_method)
          result_collection = []
          offset = 0

          loop do
            result = client.public_send(list_method, :offset => offset, :limit => PAGED_SIZE)
            break unless result.data

            result_collection += result.data
            break if result.data.length < PAGED_SIZE

            offset += PAGED_SIZE
          end

          result_collection
        end
      end
    end
  end
end
