class Word
  include DataMapper::Resource

  property :id,         Serial
  property :word,       String
  property :definition, Text
  property :counter,    Integer
  property :created_at, DateTime
end