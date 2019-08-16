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
          @identity ||= { "x-rh-identity" => Base64.encode64({ "identity" => { "account_number" => ORCHESTRATOR_TENANT }}.to_json) }
        end
      end
    end
  end
end
