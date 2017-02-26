require "csv"
Dir["./db/seeds/data/*exclusions-#{TYPE}.csv"].each do |fn|
  CSV.foreach(fn, :headers => true) do |row|
    exclusion_obj = clean_data row.to_hash.symbolize_keys!
    voyage = extract_voyage("Voyage", exclusion_obj)
    singleton = create_singleton("Exclusion", exclusion_obj)
    association_obj = { exclusion_id: singleton.id }

    associate_singleton_with_groupings_collection(voyage.exclusion_groupings,
                                                  association_obj) if voyage.try(:valid?)
  end
end