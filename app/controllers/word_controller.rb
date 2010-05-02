class WordController < ApplicationController
  respond_to :html
  
  def index
    respond_with(@wod = Api::Wordnik.word_of_the_day)
  end

  def random
    respond_with(@word = Api::Wordnik.random_word)
  end

end
