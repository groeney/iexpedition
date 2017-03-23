require "csv"
Dir["./db/seeds/data/*destination-highlights-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    highlight_obj = clean_data row.to_hash.symbolize_keys!
    destination = extract_resource("Destination", highlight_obj, "destination_name")
    singleton = create_singleton("Highlight", highlight_obj)

    next unless destination.try(:valid?)

    association_obj = { highlight_id: singleton.id }
    associate_singleton_with_groupings_collection(destination.highlight_groupings, association_obj)
  end
end