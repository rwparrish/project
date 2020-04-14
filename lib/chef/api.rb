class Api 
  
  def self.get_meals(protien)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{protien}"
    response = HTTParty.get(url)
    meals = response["meals"]
    meals.each {|m| Meal.new(name: m["strMeal"], meal_id: m["idMeal"])}
    
  end
  
end