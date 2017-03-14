require "csv"
Dir["./db/seeds/data/*histories-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    history_obj = clean_data row.to_hash.symbolize_keys!

    destination = extract_resource("Destination", history_obj, "destination_name")
    singleton = create_singleton("History", history_obj)

    associate_singleton_with_collection(destination.histories, singleton) if destination.try(:valid?)
  end
end