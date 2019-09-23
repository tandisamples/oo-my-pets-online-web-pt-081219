class Owner
  attr_accessor   
  attr_reader :name, :species 
  @@all_owners = [] 


  def initialize(name, species = "human")
    @name = name
    @species = species 
    save
  end 

  def save
    @@all_owners << self 
  end 

  def say_species
    "I am a #{species}."
  end 

  def self.all 
    @@all_owners 
  end 

  def self.count 
    self.all.length 
  end 

  def self.reset_all
    self.all.clear 
  end 

  def add_cat(cat)
    cat.owner = self 
  end 

  def add_dog(dog)
    dog.owner = self 
  end 

  def cats 
    Cat.all.select {|cat| cat.owner == self}  
  end 

  def dogs  
    Dog.all.select {|dog| dog.owner == self}  
  end 

  def buy_cat(name)
    Cat.new(name, self )  
  end 

  def buy_dog(name)
    Dog.new(name, self) 
  end 

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end 
  end 

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end 
  end 

  def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self 
        cat.mood = "nervous"
        cat.owner = nil   
      end 
    end 
    Dog.all.each do |dog|
      if dog.owner == self 
        dog.mood = "nervous" 
        dog.owner = nil   
      end 
    end 
  end 

  def list_pets
    number_of_cats = Cat.all.select {|cat| cat.owner == self}.length 
    number_of_dogs = Dog.all.select {|dog| dog.owner == self}.length
    "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."

  end 


end