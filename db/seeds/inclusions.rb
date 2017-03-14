require "csv"
Dir["./db/seeds/data/*inclusions-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    inclusion_obj = clean_data row.to_hash.symbolize_keys!
    voyage = extract_voyage("Voyage", inclusion_obj)
    singleton = create_singleton("Inclusion", inclusion_obj)
    association_obj = { inclusion_id: singleton.id }

    associate_singleton_with_groupings_collection(voyage.inclusion_groupings, association_obj) if voyage.try(:valid?)
  end
end