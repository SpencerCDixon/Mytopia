require 'csv'

states = ["alaska", "alabama"]

states.each do |state|
  datafile = Rails.root + "db/data/#{state}.csv"

  CSV.foreach(datafile, headers: true) do |row|
    new_hash = {}
    row.to_hash.each_pair do |k,v|
      new_hash.merge!( { k.downcase => v } )
    end
    Neighborhood.find_or_create_by(new_hash)
  end
end
