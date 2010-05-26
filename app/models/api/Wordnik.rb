module Api
  class Wordnik < ActiveResource::Base
    self.site = "http://api.wordnik.com/"
    self.timeout = 20
    self.format = :json
    headers['api_key'] = '93258932a2cf8104dce2604abe90708fa097c4d18b9a26e52'

    def self.definitions(word)
      # word = Api::Wordnik.definitions(word)
      begin
        self.find(:all, :from => "/api/word.json/#{word}/definitions")
      rescue ActiveResource::ResourceNotFound
        puts "*** ResourceNotFound ***"
        render :action => "unfound"
      rescue ActiveResource::ClientError
        puts "*** ClientError ***"
        render :action => "unfound"
      rescue ActiveResource::ServerError
        puts "*** ServerError ***"
        render :action => "unfound"
      end
    end

    def self.random_word
      # random = Api::Wordnik.random_word
      word = self.find(:one, :from => "/api/words.json/randomWord?hasDictionaryDef=true")
    end
    
    def self.suggest(word)
      # words = Api::Wordnik.suggest(word)
      self.find(:one, :from => "/api/word.json/#{word}?useSuggest=true&literal=false")
    end

    def self.word_of_the_day
      # wod = Api::Wordnik.word_of_the_day
      self.find(:one, :from => "/api/wordoftheday.json")
    end
  end
end