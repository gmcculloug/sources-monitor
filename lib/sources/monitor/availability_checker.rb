require "sources/monitor/core/api_client"
require "sources/monitor/core/logging"
require "sources/monitor/core/messaging"

module Sources
  module Monitor
    class AvailabilityChecker
      include Logging
      include Core::ApiClient
      include Core::Messaging

      SUPPORTED_STATES = %w[available unavailable].freeze

      attr_accessor :source_state

      def initialize(source_state)
        @source_state = source_state

        unless SUPPORTED_STATES.include?(source_state)
          err_message = "Invalid Source state #{source_state} specified"
          logger.error(err_message)
          raise(err_message)
        end
      end

      def check_sources
        logger.info("AvailabilityChecker started for #{source_state} Sources")
        fetch_sources(source_state).each do |source|
          request_availability_check(source)
        end
      end

      private

      def fetch_sources(source_state)
        source_type_name = Hash[api_client.list_source_types.data.collect { |st| [st.id, st.name] }]

        sources = []
        api_client.list_sources.data.each do |source|
          next unless availability_status_matches(source, source_state)

          sources << {
            :id     => source.id.to_s,
            :tenant => source.tenant,
            :type   => source_type_name[source.source_type_id]
          }
        end
        sources
      end

      def availability_status_matches(source, source_state)
        sas = source.availability_status
        source_state == "available" ? sas == "available" : sas != "available"
      end

      def request_availability_check(source)
        logger.info("Requesting Source.availability_check [#{
          {
            "source_type"     => source[:type],
            "source_id"       => source[:id],
            "external_tenant" => source[:tenant]
          }}]")

        messaging_client.publish_topic(
          :service => "platform.topological-inventory.operations-#{source[:type]}",
          :event   => "Source.availability_check",
          :payload => {
            :params => {
              :source_id       => source[:id],
              :timestamp       => Time.now.utc,
              :external_tenant => source[:tenant]
            }
          }
        )
      end
    end
  end
end
