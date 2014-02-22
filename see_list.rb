require 'sinatra'
require 'data_mapper'
require './word'
require 'data_mapper'
require 'dm-adjust'
require 'wordnik'

DataMapper.setup(:default, 'mysql://root@localhost/vocab')

get '/' do
  @words = Word.all(:order => [ :word.asc ])
  erb :index
end

# see all words
get '/words' do
  @words = Word.all
  erb :index
end

#view a word
get '/word/:id' do
  @word = Word.get(params[:id])
  erb :word
end

DataMapper.auto_upgrade!