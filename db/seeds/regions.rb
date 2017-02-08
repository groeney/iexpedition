require "csv"
CSV.foreach("./db/seeds/data/regions.csv", :headers => true) do |row|
  region_obj = row.to_hash.symbolize_keys!
  destination = extract_resource("Destination", region_obj, "destination_name")
  associate_singleton_with_collection(
                                      destination.regions,
                                      create_singleton("Region", region_obj)
                                    )
end