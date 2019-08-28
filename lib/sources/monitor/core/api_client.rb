require "sources-api-client"

module Sources
  module Monitor
    module Core
      module ApiClient
        ORCHESTRATOR_TENANT = "system_orchestrator".freeze

        def api_client
          @api_client ||= begin
            api_client = SourcesApiClient::ApiClient.new
            api_client.default_headers.merge!(identity)
            SourcesApiClient::DefaultApi.new(api_client)
          end
        end

        def identity
          @identity ||= { "x-rh-identity" => Base64.strict_encode64({ "identity" => { "account_number" => ORCHESTRATOR_TENANT }}.to_json) }
        end

        PAGED_SIZE = 1000
        def paged_query(client, list_method)
          result_collection = []
          offset = 0

          loop do
            result = client.public_send(list_method, :offset => offset, :limit => PAGED_SIZE)
            break unless result.data

            result_collection << result.data
            break if result.data.length < PAGED_SIZE

            offset += PAGED_SIZE
          end

          result_collection.flatten
        end
      end
    end
  end
end
