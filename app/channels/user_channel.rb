module ApplicationCable
  class UserChannel < ActionCable::Channel::Base
    def subscribed
      
      stream_from "user_channel"
    end

    def unsubscribed

    end
    def speak(data)
      ActionCable.server.broadcast 'user_channel', email: data['email'])
    end
  end
end
