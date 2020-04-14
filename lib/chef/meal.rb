class Meal 
  
   attr_accessor :name, :meal_id, :protien
   
   @@all = []
   
   def initialize(name:, meal_id:)
     @name = name
     @meal_id = meal_id
     @@all << self
   end
   
   def self.all
     @@all
   end
   
   def self.find_by_protien(protien)
     @@all.select {|m| mm.protien == protien}
   end
  
  
end