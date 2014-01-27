require 'data_mapper'
require 'wordnik'
require './word'

DataMapper.setup(:default, 'mysql://username:password@hostname/database')
DataMapper.finalize
DataMapper.auto_upgrade!

puts "Database table 'words' has been created/updated."

Wordnik.configure do |config|
  config.api_key = 'YOUR_API_KEY_HERE'
end

word = ''

until word == '\q'
  print 'Look up a word: '
  word = gets.chomp

  number_of_definitions = Wordnik.word.get_definitions(word).count

  definition = ''
  (0..number_of_definitions - 1).each do |n|
    definition += "#{n + 1}. #{Wordnik.word.get_definitions(word)[n]['text']} \n "
  end

  Word.create(
    :word => word,
    :definition => definition,
    :created_at => Time.now,
  )

  puts "#{word}: \n #{definition}"
end
