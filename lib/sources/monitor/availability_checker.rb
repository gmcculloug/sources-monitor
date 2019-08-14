require "sources/monitor/core/api_client"
require "sources/monitor/core/logging"
require "sources/monitor/core/messaging"

module Sources
  module Monitor
    class AvailabilityChecker
      include Logging
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
        logger.info("Checking Sources that are #{source_state} ...")
      end
    end
  end
end
