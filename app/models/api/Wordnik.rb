module Api
  class Wordnik < ActiveResource::Base
    self.site = "http://api.wordnik.com/"
    self.timeout = 20
    headers['api_key'] = 'my_api_key'

    def self.random_word
      # random = Api::Wordnik.random_word
      word = self.find(:one, :from => "/api/words.xml/randomWord")
    end
    
    def self.word_of_the_day
      # wod = Api::Wordnik.word_of_the_day
      self.find(:one, :from => "/api/wordoftheday.xml")
    end
    
    def self.definitions(word)
      # this appears to be correct, but doesn't return anything
      self.find(:all, :from => "/api/word.xml/#{word}/definitions")
    end
  end
end