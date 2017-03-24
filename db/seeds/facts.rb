require "csv"
Dir["./db/seeds/data/*facts-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    fact_obj = clean_data row.to_hash.symbolize_keys!
    destination = extract_resource("Destination", fact_obj, "destination_name")

    next unless destination.try(:valid?)

    singleton = create_singleton("Fact", fact_obj.merge({ destination_id: destination.id }))
    associate_singleton_with_collection(destination.facts, singleton)
  end
end