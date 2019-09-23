class Cat
  attr_accessor :owner, :mood  
  attr_reader :name 
  @@cats = []

  def initialize(name, owner)
    @name = name 
    @mood = "nervous"
    @owner = owner 
    save  
  end 

  def save
    @@cats << self 
  end 

  def self.all 
    @@cats 
  end 
end