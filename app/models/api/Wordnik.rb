module Api
  class Wordnik < ActiveResource::Base
    self.site = "http://api.wordnik.com/"
    self.timeout = 20
    headers['api_key'] = 'my_api_key'

    def self.word_of_the_day
      # wod = Api::Wordnik.word_of_the_day
      self.find(:one, :from => "/api/wordoftheday.xml")
    end
  end
end