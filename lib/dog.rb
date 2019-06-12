class Dog 
  
  attr_accessor :name, :url, :breed, :sex, :age, :weight, :description 
  
  @@all = []
  
  def initialize(name = nil, url = nil)
    @name = name 
    @url = url 
    @@all << self 
  end 
  
  def self.all
    @@all
  end
  
  def self.find(index)
    self.all[index-1]
  end
  
  def doc
     Nokogiri::HTML(open(self.url))
  end
  
  def breed 
    @breed ||= doc.css("p.pet-breed").text.strip
  end
  
  def sex 
    @sex ||= doc.css("p.pet-sex").text.strip
  end 
  
  def age 
    @age ||= doc.css("p.pet-age").text.strip
  end 
  
  def weight 
    @weight ||= doc.css("p.pet-weight").text.strip 
  end 
  
  def description 
    @description ||= doc.css("div.pet-desc p")[-1].text.strip
  end 
  
end 