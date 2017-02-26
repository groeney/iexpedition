require "csv"
Dir["./db/seeds/data/*wildlife-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    wildlife_obj = clean_data row.to_hash.symbolize_keys!

    destination = extract_resource("Destination", wildlife_obj, "destination_name")
    singleton = create_singleton("Wildlife", wildlife_obj)
    association_obj = { wildlife_id: singleton.id }

    associate_singleton_with_groupings_collection(destination.wildlife_groupings,
                                                  association_obj) if destination.try(:valid?)
  end
end