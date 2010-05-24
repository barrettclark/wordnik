module Api
  class Wordnik < ActiveResource::Base
    self.site = "http://api.wordnik.com/"
    self.timeout = 20
    headers['api_key'] = '93258932a2cf8104dce2604abe90708fa097c4d18b9a26e52'

    def self.random_word
      # random = Api::Wordnik.random_word
      word = self.find(:one, :from => "/api/words.xml/randomWord?hasDictionaryDef=true")
    end
    
    def self.word_of_the_day
      # wod = Api::Wordnik.word_of_the_day
      self.find(:one, :from => "/api/wordoftheday.xml")
    end
    
    def self.definitions(word, count = 1)
      # word = Api::Wordnik.definitions(word)
      self.find(:one, :from => "/api/word.xml/#{word}/definitions?count=#{count}")
    end
  end
end