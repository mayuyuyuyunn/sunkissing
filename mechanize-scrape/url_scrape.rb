require 'csv'
require 'mechanize'

agent = Mechanize.new
# name = "../test.html"
# path = File.expand_path(name, __FILE__)
# page = agent.get("file:///#{path}")
page = agent.get('https://cosmeet.cosme.net/product/search/page/2/srt/4/fw/%93%FA%8F%C4%82%AF%8E~%82%DF')

# テーブルのレコードを取得して格納
elements = page.search('.info h2 a')

urls = []
elements.each do |ele|
  urls << ele.get_attribute('href')
end

CSV.open("urls2.csv","wb") do |csv|
  csv << urls
end
