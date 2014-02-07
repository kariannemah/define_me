require 'sinatra'
require 'data_mapper'
require './word'

DataMapper.setup(:default, 'mysql://root@localhost/vocab')

get '/' do
  @words = Word.all(:order => [ :word.asc ])
  erb :index
end

post '/' do
  @word = Word.new
end