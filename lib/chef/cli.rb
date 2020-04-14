class Cli 
  
  def run 
    puts "Welcome to cooking with protien"
    puts "Please enter a protien you wish to cook with. For example, chicken, beef, salmon, pork, etc."
    puts
    @protien = gets.strip.downcase
    Api.get_meals(@protien)
  end
  
end