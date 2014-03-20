require 'faye'

Faye::WebSocket.load_adapter('thin')

Faye.logger = lambda { |m| puts m }

app = Faye::RackAdapter.new(mount: '/chat', timeout: 25)
run app

