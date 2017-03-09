require "csv"
Dir["./db/seeds/data/*cabins-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    cabin_obj = clean_data row.to_hash.symbolize_keys!

    voyage = extract_voyage(cabin_obj)
    features = extract_named_resources(cabin_obj, :feature_names, "Feature")
    singleton = create_singleton("Cabin", cabin_obj)

    associate_singleton_with_collection(voyage.cabins, singleton) if voyage.try(:valid?)
    features.each do |feature|
      associate_singleton_with_collection(singleton.features, feature) unless feature.nil?
    end
  end
end