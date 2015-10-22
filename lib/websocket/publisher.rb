module Websocket
  class Publisher
    include Singleton
    attr_accessor :em_thread, :client

    def initialize
      self.em_thread = Thread.new do
        EM.run
      end
      self.client = Faye::WebSocket::Client.new('ws://localhost:3001/')
      self.client.on :open do |event|
      end
    end

    def publish(message)
      self.client.send(message)
    end
  end
end
