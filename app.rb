require "bundler/setup"
require "pg"
require "active_record"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection.rb"
require_relative "models/pokemon.rb"

get '/pokemons' do
  @pokemon = Pokemon.all
  erb :index
end

get '/add' do
  erb :add
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect("/pokemons/#{params[:id]}")
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :'pokemon-details'
end


delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect("/")
end


put '/pokemons/:id' do
  @pokemon = Pokemon.update(params[:pokemon])
  redirect("/pokemons/#{params[:id]}")
end
