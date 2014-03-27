module ElxChatServer

  class FayeExtension
    
    def incoming(message, callback)
      
      if message["channel"] == "/meta/subscribe" and match = message["subscription"].match(/^\/chat\/(\w+)$/)
        faye_client.publish('/admin/chat/subscribe', {action: "new subscription", client: "#{match[1]}", message: "Client #{match[1]} arrived"})
      end


      puts "Incoming #{message.inspect}"


      callback.call(message)
    end

    def outgoing(message, callback)
      puts "Outgoing: #{message.inspect}"
      callback.call message
    end


    def faye_client
      @faye_client ||= Faye::Client.new 'http://localhost:9292/chat'
    end
  end

end
