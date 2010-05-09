class WordController < ApplicationController
  require 'pp'
  respond_to :html
  
  def index
    respond_with(@wod = Api::Wordnik.word_of_the_day)
  end

  def random
    begin
      respond_with(@word = fetch_random_word_definition)
    rescue
      respond_with(@word = fetch_random_word_definition)
    end
  end
  
  private
  def fetch_random_word_definition
    Api::Wordnik.definitions(CGI.escape(Api::Wordnik.random_word.wordstring))
  end

end
