require 'httparty'    # TODO: use ActiveResource instead here
require 'wordnik/word'
require 'wordnik/definition'
require 'wordnik/example'

# Ruby wrapper to access Wordnik definitions API. Has dependency on HTTParty gem.
# No exception handling or other niceties. Intended as an API demo, not meant for production use
class WordnikExample
  include HTTParty
  base_uri 'http://api.wordnik.com/api'
  headers 'Content-Type' => 'application/json'
  
  API_KEY = '93258932a2cf8104dce2604abe90708fa097c4d18b9a26e52'

  # get an array of Example objects for a word
  def self.examples(word)
    raw_examples = self.get("/word.json/#{word}/examples", {:headers => {'api_key' => API_KEY}} )
    
    examples = Array.new
    raw_examples.each do |example|
      examples << Example.new(  :display => example['display'],
                                :rating => example['rating'],
                                :url => example['url'],
                                :title => example['title'] )
    end
    examples
  end

  # get an array of Definition objects for a word
  def self.definitions(word)
      raw_defs = self.get("/word.json/#{word}/definitions", {:headers => {'api_key' => API_KEY}} )
      
      definitions = Array.new
      raw_defs.each do |definition|
        definitions << Definition.new( :word => definition['headword'],
                                       :text => definition['text'],
                                       :extended_text => definition['extendedText'],
                                       :part_of_speech => definition['partOfSpeech'] )
      end
      definitions
  end
  
  # given a wordstring, get an array of related words
  def self.related(word)
      raw_related = self.get("/word.json/#{word}/related", {:headers => {'api_key' => API_KEY}} )
      
      words = Array.new
      raw_related.each do |type|
        type['wordstrings'].each do |word|
          words << Word.new( :wordstring => word,
                             :rel_type => type['relType'] )
        end
      end
      
      words
  end
  
  def self.word_of_the_day
    raw_word = self.get("/wordoftheday.json", {:headers => {'api_key' => API_KEY}} )
  end
end