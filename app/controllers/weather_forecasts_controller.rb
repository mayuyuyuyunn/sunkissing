class WeatherForecastsController < ApplicationController
require 'net/http'
require 'json'

  def show
    api_key = ENV['WEATHER_API_KEY']
    latitude = "35.681236"
    longitude = "139.767125"
    url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&appid=#{api_key}"
    response = Net::HTTP.get_response(URI(url))
    data = JSON.parse(response.body)
    @current_uvi = data['current']['uvi']
    @daily_uvi = data["daily"][0]["uvi"]
    case @daily_uvi
    when 0..3.9999
      @recommended_sunscreen = "SPF15程度の肌に優しい日焼け止め"
      @message = "あまり紫外線がないため、#{@recommended_sunscreen}を使用することをお勧めします！UVI指数が低い日もしっかりケアしていきましょう⭐️"
    when 4..5.9999
      @recommended_sunscreen = "SPF30以上の日焼け止め"
      @message = "中程度の数値です。外出時は#{@recommended_sunscreen}を使用することをおすすめします！"
    when 6..7.9999
      @recommended_sunscreen = "SPF50以上の日焼け止め"
      @message = "かなり高い数値になっています。#{@recommended_sunscreen}がおすすめです。帽子や日傘、サングラスなども使って物理的にも紫外線を防いでいきましょう！長時間外出する場合は、適度に休憩を取ってください！"
    when 8..10.9999
      @recommended_sunscreen = "SPF50+の日焼け止め"
      @message = "非常に強い紫外線があります。帽子やサングラス、日傘などを使うのはマストです！#{@recommended_sunscreen}を塗り、長時間外出する場合は、適度に休憩を取って、肌を保護してください。"
    else
      @recommended_sunscreen = "SPF50+の日焼け止め"
      @message = "危険なレベルの紫外線があります・・・。#{@recommended_sunscreen}がおすすめです。可能であれば、外出を控えてください。短時間に限定してください。帽子や長袖の服を着用して日傘とサングラスもマストです。肌をできるだけ保護してください！"
    end
  end
end
