require 'sinatra'
require_relative 'lib/app'
require_relative 'lib/move'
require_relative 'lib/dto/game'
require_relative 'lib/dto/board'
require_relative 'lib/dto/location'
require_relative 'lib/dto/snake'


get '/' do
    App.settings
end

post '/start' do
    # game info is sent
end

post '/move' do
    request_body = JSON.parse(request.body.read)

    move = App.new(request_body).move
    move.to_json
end

post '/end' do
    # game result is sent
end
