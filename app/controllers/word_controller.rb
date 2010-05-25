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
  
  def lookup
  end

  def suggest    
  end

  def definition
    @lookup = CGI.escape(params[:word])
    begin
      @word = Api::Wordnik.definitions(@lookup)
      if @word == Array.new
        @word = Api::Wordnik.suggest(@lookup)
        render :action => "suggest"
      else
        respond_with(@word)
      end
    rescue ActiveResource::ResourceNotFound
      @word = Api::Wordnik.suggest(@lookup)
      render :action => "suggest"
    end
  end
  
  private
  def fetch_random_word_definition
    @lookup = Api::Wordnik.random_word.wordstring
    word = Api::Wordnik.definitions(CGI.escape(@lookup))
    if word && (word.first.text =~ /xref/ || word == Array.new)
      word = nil
    end
    word
  end

end
