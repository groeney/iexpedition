require "csv"
CSV.foreach("./db/seeds/data/destinations.csv", :headers => true) do |row|
  create_singleton("Destination", row.to_hash.symbolize_keys!)
end