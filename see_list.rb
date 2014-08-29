require 'sinatra'
require 'data_mapper'
require './word'
require 'dm-adjust'
require 'dm-aggregates'
require 'wordnik'

DataMapper.setup(:default, 'mysql://root@localhost/vocab')

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @words = Word.all(:order => [ :word.asc ])
  erb :index
end

#view a word
get '/word/:id' do
  @word = Word.get(params[:id])
  erb :word
end

post '/' do
  if Word.all(:word => params[:word]).count != 0

    @word = Word.first(:word => params[:word])
    @word.adjust!(:counter => +1)
  else
    @word = Word.new
      Wordnik.configure do |config|
        config.api_key = YOUR_WORDNIK_API_KEY_HERE
      end

      result = Wordnik.word.get_definitions(params[:word])
      number_of_definitions = result.count

      if number_of_definitions > 0
        definition = ''
        result.each.with_index do |definition_hash, index|
          definition += "#{index + 1}. #{definition_hash['text']} "
        end
        @word.word = params[:word]
        @word.definition = definition
        @word.created_at = Time.now
        @word.counter = 1
      end
  end

  if @word.save
    redirect "/word/#{@word.id}"
  else
    redirect '/'
  end
end

delete '/' do
  # delete a word
  # add a delete link to each word
  @word = Word.first(:word => params[:word])
  # if deletion works, reload index, if not, reload word view
  if @word.delete
    redirect "/word/#{@word.id}"
  else
    redirect '/'
  end
end
