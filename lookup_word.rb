require 'data_mapper'
require 'dm-adjust'
require 'wordnik'
require './word'

DataMapper.setup(:default, 'mysql://root@localhost/vocab')
DataMapper.finalize
DataMapper.auto_upgrade!

puts "Database table 'words' has been created/updated."

Wordnik.configure do |config|
  config.api_key = 'f278cd45f78024aa5a70f0b33a703d3cd544c282ad84ccea1'
end

word = ''

while word
  puts "Look up a word:"
  word = gets.chomp

  break if word == "exit"

  number_of_definitions = Wordnik.word.get_definitions(word).count

  if number_of_definitions > 0

    definition = ''
    (0..number_of_definitions - 1).each do |n|
      definition += "#{n + 1}. #{Wordnik.word.get_definitions(word)[n]['text']} \n "
    end

    if Word.all(:word => word).count == 0
      Word.create(
        :word => word,
        :definition => definition,
        :created_at => Time.now,
        :counter => 1,
      )
    else
      old_word = Word.all(:word => word)
      old_word.adjust!(:counter => +1)
    end

    puts "#{word}: \n #{definition}"
  end
end

