module Websocket
  class Subscriber
    def run
      EM::WebSocket.start(host: 'localhost', port: 3000) do |ws_conn|
      end
    end
  end
end
