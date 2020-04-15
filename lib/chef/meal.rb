class Meal 
  
   attr_accessor :name, :meal_id, :protien, :instructions, :ingredients, :measures 
   
   @@all = []
   
   def initialize(name:, meal_id:, protien:)
     @name = name
     @meal_id = meal_id
     @protien = protien
     @ingredients = [] 
     @measures = []
     @@all << self
   end
   
   def self.all
     @@all
   end
   
   def self.find_by_protien(protien)
    
     @@all.select {|m| m.protien == protien}
   end
  
  
end