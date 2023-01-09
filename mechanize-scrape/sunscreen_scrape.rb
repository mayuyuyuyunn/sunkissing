require 'csv'
require 'mechanize'
require 'nokogiri'
require_relative 'urlcsv/urls_ary.rb'

agent = Mechanize.new

# ローカルファイルにてスクレイピング実行
# name = "../sunscreen.html"
# path = File.expand_path(name, __FILE__)
# page = agent.get("file:///#{path}")

# file = File.open('')

$urls_ary.each do |n|
  sleep(2)
  # 商品詳細ページにアクセス
  url = ""
  page = agent.get(url)

  # 商品名取得
  product_name_elements = page.search('#product-spec .cat-name')
  name = product_name_elements.children.inner_text
  # 容量・税込み価格
  capacity = page.at('//*[@id="pdt-info-newdb-1606"]/div[2]/div/ul/li[@class="clearfix"]/p[@class="info-desc"]').text
  # メーカ名
  maker = page.search('//*[@id="product-spec"]/dl[@class="maker clearfix"]/dd').inner_text
  # ブランド名
  brand = page.search('//*[@id="product-spec"]/dl[@class="brand-name clearfix"]/dd/a').inner_text
  # SPF
  spf = page.search('//*[@id="product-spec"]/dl[@class="spf clearfix"]/dd').inner_text
  # 商品説明
  desc = page.search('//*[@id="product-spec"]/dl[@class="item-description clearfix"]/dd').inner_text
  # 商品カテゴリー
  product_category = page.search('//*[@id="product-spec"]/dl[@class="item-category clearfix"]/dd').inner_text
  # 色
  color = page.search('//*[@id="product-spec"]/dl[@class="color clearfix"]/dd').inner_text
  # pick up カテゴリー
  pick_category = page.search('//*[@id="product-spec"]/dl[@class="pickup-category clearfix"]/dd').inner_text


  CSV.open("sunscreens#{n}.csv",'w', force_quotes: true) do |csv|
    csv << ['name', 'capacity', 'maker', 'brand', 'spf', 'desc', 'product_category','color', 'pick_category']
    csv << [name, capacity, maker, brand, spf, desc, product_category, color, pick_category]
  end
end

# メーカー名とブランド名は下記のやり方でも取得できる
# product_name_elements = page.search('#product-spec dl dd')
# p product_name_elements.children[0].inner_text
# p product_name_elements.children[1].inner_text
