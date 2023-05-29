class WeatherForecastsController < ApplicationController
  require 'net/http'
  require 'json'
  before_action :set_q, only: [:show]

  def show
    #current_userがnilのときは未選択でUVI情報表示
    @prefecture = current_user&.prefecture || Prefecture.find_by(name: '未選択')
    weatherforcast = OpenWeatherApiService.new(@prefecture)
    weatherforcast.get_today_information
    set_sunscreen_recommendation(@daily_uvi)
  end

  private

  def set_q
    @q = Sunscreen.ransack(params[:q])
  end

  def set_sunscreen_recommendation(daily_uvi)
    case daily_uvi
    when 0..3.9999
      @recommended_sunscreen = "SPF15~30の肌に優しい日焼け止め"
      @message = "今日は比較的紫外線が少ないため、#{@recommended_sunscreen}を使用することをおすすめします。UVI指数が低い日もしっかりケアしていきましょう⭐️"
      @value = 30
    when 4..5.9999
      @recommended_sunscreen = "SPF30以上の日焼け止め"
      @message = "今日は中程度の数値です。外出時は#{@recommended_sunscreen}を使用することをおすすめします。UVI指数が中程度の日も油断は禁物です！本日もしっかりケアしていきましょう⭐️"
      @value = 30
    when 6..7.9999
      @recommended_sunscreen = "SPF50以上の日焼け止め"
      @message = "今日はかなり高い数値になっています。#{@recommended_sunscreen}がおすすめです。帽子や日傘、サングラスなども使って物理的にも紫外線を防いでいきましょう！長時間外出する場合は、適度に休憩を取ってください！"
      @value = 50
    when 8..10.9999
      @recommended_sunscreen = "SPF50+の日焼け止め"
      @message = "今日は非常に強い紫外線があります。帽子やサングラス、日傘などを使うのはマストです！#{@recommended_sunscreen}を塗り、長時間外出する場合は、適度に休憩を取って水分補給も忘れずにしてください⭐️"
      @value = 55
    else
      @recommended_sunscreen = "SPF50+の日焼け止め"
      @message = "危険なレベルの紫外線があります・・・。#{@recommended_sunscreen}がおすすめです。可能であれば、外出を控えてください。外出をする場合は、できる限り短時間に限定してください。帽子や長袖の服を着用して日傘とサングラスもマストです。肌をできるだけ保護してください！"
      @value = 55
    end
  end
end
