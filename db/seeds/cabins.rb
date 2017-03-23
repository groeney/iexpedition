require "csv"
Dir["./db/seeds/data/*cabins-#{TYPE}.csv"].each do |fn|
  new_file(fn)
  CSV.foreach(fn, :headers => true) do |row|
    cabin_obj = clean_data row.to_hash.symbolize_keys!
    voyage = extract_voyage(cabin_obj)

    next unless voyage.try(:valid?)

    features = extract_or_create_named_resources(cabin_obj, :feature_names, "Feature")
    cabin_grouping_attrs = {
      availability: cabin_obj.delete(:availability),
      discount_amount: cabin_obj.delete(:discount_amount)
    }.reject{|k,v| v.blank?}
    singleton = create_singleton("Cabin", cabin_obj)
    features.each do |feature|
      associate_singleton_with_collection(singleton.features, feature) unless feature.nil?
    end

    associate_singleton_with_collection(voyage.cabins, singleton)
    cabin_grouping = voyage.cabin_groupings.find_by(voyage_id: voyage.id, cabin_id: singleton.id)
    cabin_grouping.update_attributes(cabin_grouping_attrs) if cabin_grouping.try(:valid?)
  end
end