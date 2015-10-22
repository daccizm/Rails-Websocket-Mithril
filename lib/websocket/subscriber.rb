require 'daemons'
require 'em-websocket'

Daemons.run_proc('subscriber') do
  connections = []
  EM::WebSocket.start(host: 'localhost', port: 3001) do |ws_conn|
    ws_conn.onopen do
      puts ws_conn.inspect
      connections << ws_conn
    end

    ws_conn.onmessage do |message|
      connections.each do |conn|
        conn.send(message)
      end
    end
  end
end
