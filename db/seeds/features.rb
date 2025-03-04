require "csv"
Dir["./db/seeds/data/*features-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    feature_obj = clean_data row.to_hash.symbolize_keys!
    ship = extract_ship(feature_obj)
    singleton = create_singleton("Feature", feature_obj)

    next unless ship.try(:valid?)

    association_obj = { feature_id: singleton.id }
    associate_singleton_with_groupings_collection(ship.feature_groupings, association_obj)
  end
end