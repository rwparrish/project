class Protein
  
  attr_accessor :name, :meals
  
  @@all = []
  
  def initialize(name)
    @name = name
    @meals = []
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  # serch for a given protein by name - find returns nil if not
  #before with the find_meal_by_protein the program would serach through all meals to find matches - now the program can find meals that belong to a protein
  
  def self.find_by_protein(protein)
    @@all.find { |p| p.name == name}
  end
  
end