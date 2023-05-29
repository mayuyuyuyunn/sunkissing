class OpenWeatherApiService

  def initialize(obj)
    @latitude = obj.latitude
    @longitude = obj.longitude
  end

  def get_today_information
    api_key = ENV['WEATHER_API_KEY']
    url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{@latitude}&lon=#{@longitude}&exclude=minutely,alerts&appid=#{api_key}"
    response = Net::HTTP.get_response(URI(url))
    data = JSON.parse(response.body)
    @daily_uvi = data["daily"][0]["uvi"]
  end
end
