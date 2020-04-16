class Cli 
  
  def run 
    puts "Welcome to cooking with protein!"
    prompt_protein
    prompt_num
    input = gets.strip.downcase
    while input != 'exit'
    # binding.pry
      if input == 'list'
        print_meals(Protein.find_by_protein(@protein).meals)
      elsif input.to_i > 0 && input.to_i <= Protein.find_by_protein(@protein).meals.length 
        meal = Protein.find_by_protein(@protein).meals[input.to_i - 1]
        Api.get_meal_details(meal) if !meal.instructions
        print_meal(meal)
      elsif input == "protein"
        prompt_protein
      else 
        puts "Does not compute - please try again!"
          puts " "
      end
      prompt_num
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
  
  def prompt_num
    puts " "
    puts "Pick a number to see the recipe, type 'list' to see the list again, type 'protein' to choose another protein, or 'exit' to exit."
    puts " "
  end
  
  def prompt_protein
    @protein = " "
    while !Protein.find_by_protein(@protein) do
      puts " "
      puts "Please enter a protein you wish to cook with. For example: chicken, beef, salmon, pork, etc."
      @protein = gets.strip.downcase
      Api.get_meals(@protein) if !Protein.find_by_protein(@protein)
    end
    print_meals(Protein.find_by_protein(@protein).meals) if Protein.find_by_protein(@protein)
  end
  
end