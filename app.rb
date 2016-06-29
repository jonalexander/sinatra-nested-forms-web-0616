require 'pry'
require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do 
      erb :root
    end

    get '/new' do 
      erb :'/pirates/new'
    end

    post '/pirates' do 
      # create pirate data to use in show.erb
      @pirate = Pirate.new(params[:pirate])
      #binding.pry

     
      params[:pirate][:ships].each do |ship_details|
        #binding.pry
        # => {"0" => {name: "", type: "", booty: ""}}
        # want to pass 'details' hash to Ship constructor
        Ship.new(ship_details)
        #binding.pry
      end

      # collect ships in hash to use in show.erb
      @ships = Ship.all

      # render show view
      erb :'/pirates/show'
    end
  end
end
