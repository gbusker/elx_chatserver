require 'faye'
require 'elx_chatserver/faye_extension'

Faye::WebSocket.load_adapter('thin')

# Faye.logger = lambda { |m| puts m }

app = Faye::RackAdapter.new(mount: '/chat', timeout: 25)

app.add_extension ElxChatServer::FayeExtension.new

run app

