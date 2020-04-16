class Api 
  
  def self.get_meals(protein)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{protein}"
    response = HTTParty.get(url)
    meals = response["meals"]
    new_protein = Protein.new(protein)
    meals.each do |m|
      new_meal = Meal.new(name: m["strMeal"], meal_id: m["idMeal"], protein: protein)
      new_protein.meals << new_meal
    end
    binding.pry
  end
  
  def self.get_meal_details(meal)
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    response = HTTParty.get(url)
    meal_details = response["meals"]
    meal.instructions = meal_details[0]["strInstructions"]
  end
  
end