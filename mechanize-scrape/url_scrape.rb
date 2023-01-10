require 'csv'
require 'mechanize'
require_relative './urlcsv/urls_ary.rb'

agent = Mechanize.new
# ローカルファイルにてスクレイピング実行
# name = "../test.html"
# path = File.expand_path(name, __FILE__)
# page = agent.get("file:///#{path}")


(0..100).each do |i|
  url = ""
  page = agent.get("#{url}")
  # テーブルのレコードを取得して格納
  elements = page.search('.info h2 a')

  urls = []
  elements.each do |ele|
    urls << ele.get_attribute('href')
  end

  # URLの数字部分に合わせて　csvファイルの名前を変える
  CSV.open("urls#{i}.csv","wb") do |csv|
    csv << urls
  end
end
