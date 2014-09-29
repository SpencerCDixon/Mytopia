require 'csv'

datafile = Rails.root + 'db/alaska.csv'

CSV.foreach(datafile, headers: true) do |row|
  new_hash = {}
  row.to_hash.each_pair do |k,v|
    new_hash.merge!({k.downcase => v})
  end
  Neighborhood.create(new_hash)
end
