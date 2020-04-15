class Cli 
  
  def run 
    puts "Welcome to cooking with protien!"
    puts " "
    puts "Please enter a protien you wish to cook with. For example: chicken, beef, salmon, pork, etc."
    @protien = gets.strip.downcase
    Api.get_meals(@protien)
    print_meals(Meal.all)
    prompt
    input = gets.strip.downcase
    while input != 'exit'
      if input == 'list'
        print_meals(Meal.find_by_protien(@protien))
      elsif input.to_i > 0 && input.to_i <= Meal.find_by_protien(@protien).length 
        meal = Meal.find_by_protien(@protien)[input.to_i - 1]
        Api.get_meal_details(meal) if !meal.instructions
        print_meal(meal)
      elsif input == "protien"
      
      else 
        puts "Does not compute - please try again!"
          puts " "
      end
      prompt 
      input = gets.strip.downcase
    end
    puts " "
    puts "Bon appetit!"
  end
  
  def print_meals(meals)
    puts"Dishes made with #{@protien}:"
    puts " "
    meals.each.with_index(1) do |meal, i|
      puts "#{i}. #{meal.name}"
    end
  end
  
  def print_meal(meal)
    puts meal.name
    puts meal.instructions
  end
  
  def prompt
    puts " "
    puts "Pick a number to see the recipe, type 'list' to see the list again, 'protien' to choose another protien, or 'exit' to exit."
    puts " "
  end
  
end