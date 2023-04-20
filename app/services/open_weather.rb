class OpenWeather
  attr_accessor :data


      def initialize(lat,lon)
        @data = {
          lat: lat,
          lon: lon,
          units: 'metric',
          appid: ENV['WEATHER_API_KEY'],
        }
      end
end
