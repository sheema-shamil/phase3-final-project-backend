require_relative './config/environment'

run TodoController

require 'sinatra/base'

class App < Sinatra::Base
  connections = []

  get '/subscribe', provides: 'text/event-stream'  do
    # register a client's interest in server events
    stream(:keep_open) do |out|
      connections << out
      # purge dead connections
      connections.reject!(&:closed?)
    end
  end

  post '/' do
    connections.each do |out|
      # notify client that a new message has arrived
      out << "data: #{params[:msg]}\n\n"

      # indicate client to connect again
      out.close
    end

    204 # response without entity body
  end
end

run App