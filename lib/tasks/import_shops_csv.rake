require 'csv'

desc 'Import Shops from CSV file'
task :import => [:environment] do
  file = "db/shops_shopmium.csv"
  CSV.foreach(file, :headers => true).with_index  do |row, i|
    shop = Shop.new(chain: row[0],
      name: row[1],
      latitude: row[2],
      longitude: row[3],
      address: row[4],
      city: row[5],
      zip: row[6],
      phone: row[8],
      country_code: row[18])

    if row[0].nil?
      p "--- Chain is blank line #{i + 2} in csv file, please add chain"
      p "#{shop.name} - #{shop.address} - #{shop.city} - #{shop.zip}"
      shop.chain = STDIN.gets.chomp
    elsif row[1].nil?
      p "--- Name is blank line #{i + 2} in csv file, please add name"
      p "#{shop.chain} - #{shop.address} - #{shop.city} - #{shop.zip}"
      shop.name = STDIN.gets.chomp
    elsif row[2].nil?
      p "--- Latitude is blank line #{i + 2} in csv file, please add latitude"
      p "#{shop.name} - #{shop.address} - #{shop.city} - #{shop.zip}"
      shop.latitude = STDIN.gets.chomp
    elsif row[3].nil?
      p "--- Longitude is blank line #{i + 2} in csv file, please add longitude"
      p "#{shop.name} - #{shop.address} - #{shop.city} - #{shop.zip}"
      shop.longitude = STDIN.gets.chomp
    elsif row[4].nil?
      p "--- Address is blank line #{i + 2} in csv file, please add address"
      p "#{shop.name} - #{shop.city} - #{shop.zip}"
      shop.address = STDIN.gets.chomp
    elsif row[5].nil?
      p "--- City is blank line #{i + 2} in csv file, please add city"
      p "#{shop.name} - #{shop.address} - #{shop.zip}"
      shop.city = STDIN.gets.chomp
    end

    shop.save! #CREATE SHOP HERE

  end
end

