class Cli 
  
  def run 
    puts "Welcome to cooking with protein!"
    puts " "
    puts "Please enter a protein you wish to cook with. For example: chicken, beef, salmon, pork, etc."
    @protein = gets.strip.downcase
    Api.get_meals(@protein)
    print_meals(Meal.all)
    prompt
    input = gets.strip.downcase
    while input != 'exit'
      if input == 'list'
        print_meals(Meal.find_by_protein(@protein))
      elsif input.to_i > 0 && input.to_i <= Meal.find_by_protein(@protein).length 
        meal = Meal.find_by_protein(@protein)[input.to_i - 1]
        Api.get_meal_details(meal) if !meal.instructions
        print_meal(meal)
      elsif input == "protein"
      
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
    puts"Dishes made with #{@protein}:"
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
    puts "Pick a number to see the recipe, type 'list' to see the list again, type 'protein' to choose another protein, or 'exit' to exit."
    puts " "
  end
  
end