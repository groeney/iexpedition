require "csv"
CSV.foreach("./db/seeds/data/destinations.csv", :headers => true) do |row|
  destination_obj = row.to_hash.symbolize_keys!
  create_or_update_singleton("Destination", destination_obj)
end