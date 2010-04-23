class Example
  
  attr_accessor :display, :rating, :url, :title, :year
  
  def initialize(options={})
    @display = options[:display]
    @rating = options[:rating]
    @url = options[:url]
    @title = options[:title]
    @year = options[:year]
  end
  
end