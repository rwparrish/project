class Meal 
  
   attr_accessor :name, :meal_id, :protein, :instructions, :ingredients, :measures 
   
   @@all = []
   
   def initialize(name:, meal_id:, protein:)
     @name = name
     @meal_id = meal_id
     @protein = protein
     @ingredients = [] 
     @measures = []
     @@all << self
   end
   
   def self.all
     @@all
   end
   
   def self.find_by_protein(protein)
    @@all.select {|m| m.protein == protein}
   end
  
  
end