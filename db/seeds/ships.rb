require "csv"
CSV.foreach("./db/seeds/data/ships.csv", :headers => true) do |row|
  ship = create_singleton("Ship", row.to_hash.symbolize_keys!)
end