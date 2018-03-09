# my_app.rb
require 'sinatra/base'
require_relative 'player.rb'
require_relative 'game.rb'

class Battle < Sinatra::Base
  # ... app code here ...

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:Player_1_name])
    $player2 = Player.new(params[:Player_2_name])
    redirect('/play')
  end

  get '/play' do
    @player1 = $player1
    @player2 = $player2
    erb(:play)
  end

  get '/attack' do
    @player1 = $player1
    @player2 = $player2
    Game.new.attack(@player2)
    erb(:attack)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
