class Api 
  
  def self.get_meals(protien)
    url = "https://www.themealdb.com/api/json/v1/1/filter.php?i=#{protien}"
    response = Net::HTTP.get(URI(url))
    
  end
  
end