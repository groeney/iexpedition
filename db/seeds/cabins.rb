require "csv"
Dir["./db/seeds/data/*cabins-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    cabin_obj = clean_data row.to_hash.symbolize_keys!

    voyage = extract_voyage(cabin_obj)
    singleton = create_singleton("Cabin", cabin_obj)

    associate_singleton_with_collection(voyage.cabins, singleton) if voyage.try(:valid?)
  end
end