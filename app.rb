require "sinatra"
require 'sinatra/reloader' if development?

require_relative "lib/mastermind"

mastermind = nil

get '/' do 
  mastermind = Mastermind.new
  erb :index
end

get '/set_key' do
  erb :set_key
end

post '/set_key' do
  mastermind = Mastermind.new(params.values)
  redirect '/game'
end

get '/game' do
  @mastermind = mastermind
  erb :game 
end

post '/game' do
  mastermind.guess(params.values)
  redirect '/game'
end


