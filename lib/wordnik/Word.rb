class Word
  
  attr_accessor :wordstring, :rel_type
  
  def initialize(options={})
    @wordstring = options[:wordstring]
    @rel_type = options[:rel_type]
  end
  
end