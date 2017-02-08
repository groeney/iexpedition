require "csv"
Dir["./db/seeds/data/cabins.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    cabin_obj = clean_data row.to_hash.symbolize_keys!
    ship = extract_resource("Ship", cabin_obj, "ship_name")
    voyage = extract_voyage(ship, cabin_obj)

    cabins = associate_singleton_with_collection(
                                                  voyage.cabins,
                                                  create_singleton("Cabin", cabin_obj)
                                                )
  end
end