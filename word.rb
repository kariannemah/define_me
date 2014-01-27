class Word
  include DataMapper::Resource

  property :id,         Serial
  property :word,       String
  property :definition, Text
  property :created_at, DateTime
end