require "kemal"

SOCKETS = [] of HTTP::WebSocket
ws "/chat" do |socket|
  SOCKETS << socket
  socket.on_message do |message|
    SOCKETS.each { |socket| socket.send message}
  end
  socket.on_close do
    SOCKETS.delete socket
  end
end

Kemal.run
