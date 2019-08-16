module Sources
  module Monitor
    module Core
      module Messaging
        def messaging_client
          require "manageiq-messaging"

          @messaging_client ||= ManageIQ::Messaging::Client.open(
            :protocol => :Kafka,
            :host     => ENV["QUEUE_HOST"] || "localhost",
            :port     => ENV["QUEUE_PORT"] || "9092",
            :encoding => "json"
          )
        end
      end
    end
  end
end
