class Api 
  
  def self.get_meals(protein)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{protein}"
    response = HTTParty.get(url)
    meals = response["meals"]
    if meals
      new_protein = Protein.new(protein)
      meals.each do |m|
        new_meal = Meal.new(name: m["strMeal"], meal_id: m["idMeal"], protein: protein)
        new_protein.meals << new_meal
      end
    end
  end
  
  def self.get_meal_details(meal)
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    response = HTTParty.get(url)
    meal_details = response["meals"][0]
    meal.instructions = meal_details["strInstructions"]
    meal_details.keys.each do |k| 
      meal.ingredients << meal_details[k] if (k.include? "ingredient") && meal_details[k]
      meal.measures << meal_details[k] if (k.include? "Measure") && meal_details[k]
    end
  end
  
end