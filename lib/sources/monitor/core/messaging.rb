module Sources
  module Monitor
    module Core
      module Messaging
        def client
          require "manageiq-messaging"

          @client ||= ManageIQ::Messaging::Client.open(
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
