require 'csv'
require 'tempfile'

states = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "FL", "GA",
          "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
          "ME", "MI", "MN", "MO", "MS", "MT", "NC", "NE", "NJ", "NM",
          "NV", "NY", "OH", "OR", "PA", "RI", "TN", "TX", "UT", "VA",
          "WA", "WI"]

states.each do |state|
  puts "Loading: #{state}"
  datafile = Rails.root + "db/data/ZillowNeighborhoods-#{state}.csv"

  temp = Tempfile.new('data')
  sanitized_datafile = File.read(datafile).delete("\0")
  temp.write(sanitized_datafile)
  temp.close


  CSV.foreach(temp, headers: true) do |row|

    new_hash = {}
    row.to_hash.each_pair do |k,v|
      new_hash.merge!( { k.downcase => v } )
    end

    Neighborhood.find_or_create_by(new_hash)
  end
end
