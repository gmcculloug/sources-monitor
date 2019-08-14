require "manageiq/loggers"

module Sources
  module Monitor
    class << self
      attr_writer :logger
    end

    def self.logger
      @logger ||= ManageIQ::Loggers::CloudWatch.new
    end

    module Logging
      def logger
        Sources::Monitor.logger
      end
    end
  end
end
