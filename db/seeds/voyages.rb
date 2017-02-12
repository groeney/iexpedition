require "csv"
Dir["./db/seeds/data/*voyages.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    voyage_obj = clean_data row.to_hash.symbolize_keys!
    ship = extract_resource("Ship", voyage_obj, "ship_name")
    destination = extract_resource("Destination", voyage_obj, "destination_name")
    region = extract_resource("Region", voyage_obj, "region_name")
    voyage_obj.merge!({
      destination: destination,
      region: region,
      ship: ship,
    })

    voyages = associate_singleton_with_collection(
                                                  ship.voyages,
                                                  create_singleton("Voyage", voyage_obj)
                                                )
  end
end