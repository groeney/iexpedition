require "csv"
Dir["./db/seeds/data/*histories-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    history_obj = clean_data row.to_hash.symbolize_keys!
    destination = extract_resource("Destination", history_obj, "destination_name")

    next unless destination.try(:valid?)

    singleton = create_singleton("History", history_obj.merge({ destination_id: destination.id }))
    associate_singleton_with_collection(destination.histories, singleton)
  end
end