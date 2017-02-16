require "csv"
CSV.foreach("./db/seeds/data/regions.csv", :headers => true) do |row|
  region_obj = row.to_hash.symbolize_keys!
  destination = extract_resource("Destination", region_obj, "destination_name")
  singleton = create_or_update_singleton("Region", region_obj)

  associate_singleton_with_collection(destination.regions, singleton)
end