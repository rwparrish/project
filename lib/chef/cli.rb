class Cli 
  
  def run 
    puts "Welcome to cooking with protien"
    puts "Please enter a protien you wish to cook with. For example, chicken, beef, salmon, pork, etc."
    puts
    @protien = gets.strip.downcase
    Api.get_meals(@protien)
    print_meals(Meal.all)
    binding.pry
  end
  
  def print_meals(meals)
    puts"Meals made with #{@protien}:"
    puts " "
    meals.each.with_index(1) do |meal, i|
      puts "#{i}. #{meal.name}"
    end
  end
  
end