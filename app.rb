require "sinatra"

require_relative "./lib/mastermind"

enable :sessions

get '/' do
  session.clear
  erb :index
end

get '/set_key' do
  erb :set_key
end

post '/set_key' do
  session[:key] = params.values
  redirect '/game'
end

get '/game' do
  session[:guesses] ||= []
  @mastermind = Mastermind.new(session[:guesses], session[:key])
  session[:key] = @mastermind.key
  erb :game 
end

post '/game' do
  session[:guesses] << params.values
  redirect '/game'
end