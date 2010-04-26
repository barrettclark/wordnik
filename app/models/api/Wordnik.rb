module Api
  class Wordnik < ActiveResource::Base
    self.site = "http://api.wordnik.com/api"
    self.timeout = 20
    self.format = :json
    headers['api_key'] = 'my_key'

    def self.word_of_the_day
      # wod = Api::Wordnik.word_of_the_day
      self.find(:one, :from => "/wordoftheday.json")
      # self.find(:one, :from => :wordoftheday)
    end
  end
end