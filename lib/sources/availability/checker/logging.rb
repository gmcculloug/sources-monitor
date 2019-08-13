require "manageiq/loggers"

module Sources
  module Availability
    module Checker
      class << self
        attr_writer :logger
      end

      def self.logger
        @logger ||= ManageIQ::Loggers::CloudWatch.new
      end

      module Logging
        def logger
          Sources::Availability::Checker.logger
        end
      end
    end
  end
end
