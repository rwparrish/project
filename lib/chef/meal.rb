class Meal 
  
   attr_accessor :name, :meal_id, :protien, :instructions
   
   @@all = []
   
   def initialize(name:, meal_id:, protien:)
     @name = name
     @meal_id = meal_id
     @protien = protien
     @@all << self
   end
   
   def self.all
     @@all
   end
   
   def self.find_by_protien(protien)
    
     @@all.select {|m| m.protien == protien}
   end
  
  
end