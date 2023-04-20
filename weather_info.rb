require 'net/http'
require 'json'

# APIキーと緯度経度の指定
api_key = ENV["WEATHER_API_KEY"]
lat = "35.68944"
lon = "139.69167"

# APIリクエストを送信してレスポンスを取得
url = "https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&appid=#{api_key}&units=metric&lang=ja"
response = Net::HTTP.get(URI.parse(url))

# レスポンスのJSONデータをパース
data = JSON.parse(response)

# 現在の天気とUVI情報を取得
# current_weather = data['current']['weather'][0]['description']
# current_uvi = data['current']['uvi']
puts data

# 当日の天気情報から雨が降るかどうかを判定
will_rain = false
data['hourly'].each do |hourly_data|
  if hourly_data['weather'][0]['main'] == 'Rain'
    will_rain = true
    break
  end
end

# 結果を出力
puts "現在の天気：#{current_weather}"
puts "現在のUVI：#{current_uvi}"
# puts "今日の最高UVI指数：#{max_uvi}"
puts "今日は#{will_rain ? '雨が降る' : '雨は降らない'}予定です。"
