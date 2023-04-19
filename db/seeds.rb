require 'csv'

csv_file_path = Rails.root.join('db', 'csv', 'prefectures.csv')

# CSVファイルを開き、各行ごとにPrefectureモデルのインスタンスを作成し、データベースに保存
CSV.foreach(csv_file_path, headers: true, col_sep: ',') do |row|
  Prefecture.create!(
    name: row['name'],
    capital_city: row['capital_city'],
    latitude: row['latitude'].to_f,
    longitude: row['longitude'].to_f
  )
end
