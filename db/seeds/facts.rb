require "csv"
Dir["./db/seeds/data/*fact-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    fact_obj = clean_data row.to_hash.symbolize_keys!

    destination = extract_resource("Destination", fact_obj, "destination_name")
    singleton = create_singleton("Fact", fact_obj)

    associate_singleton_with_collection(destination.facts, singleton) if destination.try(:valid?)
  end
end