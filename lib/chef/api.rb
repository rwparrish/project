class Api 
  
  def self.get_meals(protien)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{protien}"
    response = HTTParty.get(url)
    meals = response["meals"]
    meals.each {|m| Meal.new(name: m["strMeal"], meal_id: m["idMeal"], protien: protien)}
  end
  
  def self.get_meal_details(meal)
    url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal.meal_id}"
    response = HTTParty.get(url)
    meal_details = response["meals"]
    meal.instructions = meal_details[0]["strInstructions"]
  end
  
end