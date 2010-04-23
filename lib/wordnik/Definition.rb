class Definition
  
  attr_accessor :headword, :text, :extended_text, :part_of_speech
  
  def initialize(options={})
    @headword = options[:headword]
    @text = options[:text]
    @extended_text = options[:extended_text]
    @part_of_speech = options[:part_of_speech]
  end
  
end